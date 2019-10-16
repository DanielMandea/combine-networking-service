//
//  File.swift
//  
//
//  Created by Daniel Mandea on 22/09/2019.
//

import Foundation
import Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension Requests where Self: BaseService<DefaultServiceConfiguration>, Self: RequestComposer {
    
    public func fetch<T: Codable>(with request: URLRequest) -> AnyPublisher<T, Error> {
        return taskPublisher(for: request)
            .mapError { $0 as Error }
            .tryMap { output in
                return try BaseService<DefaultServiceConfiguration>.validate(output.data, output.response)
        }
        .decode(type: T.self, decoder: JSONDecoder())
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    public func fetch<T: Codable>(with method: HttpMethod, path: String? = nil, object: T? = nil) -> AnyPublisher<T, Error> {
        let urlRequest = decodableRquest(with: method, path: path, object: object)
        return fetch(with: urlRequest)
    }
       
    public func get<T: Codable>(from path: String? = nil)  -> AnyPublisher<T, Error> {
        return fetch(with: .get, path: path)
    }
    
    public func post<T: Codable>(to path: String? = nil, object: T? = nil) -> AnyPublisher<T, Error> {
        return fetch(with: .post, path: path, object: object)
    }
}
