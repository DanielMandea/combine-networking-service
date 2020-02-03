//
//  RequestComposer.swift
//  
//
//  Created by Daniel Mandea on 27/09/2019.
//

import Foundation


@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension RequestComposer where Self: BaseService<DefaultServiceConfiguration> {
    public func decodableRequest<T: Codable>(with method: HttpMethod, path: String? = nil, object: T? = nil, headers: [String: String]? = nil) -> URLRequest {
        var urlRequest = request(with: method, path: path, headers: headers)
        if let object = object {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            urlRequest.httpBody = try! encoder.encode(object)
        }
        return urlRequest
    }
    
    public func dataRequest(with method: HttpMethod, path: String? = nil, object: Data, headers: [String: String]? = nil) -> URLRequest {
        var urlRequest = request(with: method, path: path, headers: headers)
        urlRequest.httpBody = object
        return urlRequest
    }
    
    public func request(with method: HttpMethod, path: String? = nil, headers: [String: String]? = nil) -> URLRequest {
        let url = path != nil ? configuration.baseUrl.appendingPathComponent(path!) : configuration.baseUrl
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        return urlRequest
    }
}

