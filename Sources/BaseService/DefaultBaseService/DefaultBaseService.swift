//
//  File.swift
//  
//
//  Created by Daniel Mandea on 28/09/2019.
//

import Foundation

import Foundation
import Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public class DefaultBaseService: BaseService<DefaultServiceConfiguration>, Requests, RequestComposer {

    
}

// MARK: - OAuthService

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension DefaultBaseService: BaseServiceProtocol {
    public func download(from url: URL) -> AnyPublisher<Data, Error> {
        return taskPublisher(for: URLRequest(url: url))
            .mapError { $0 as Error }
            .tryMap { output in
                return try BaseService<DefaultServiceConfiguration>.validate(output.data, output.response)
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
