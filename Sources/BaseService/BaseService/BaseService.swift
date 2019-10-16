//
//  BaseService.swift
//  
//
//  Created by Daniel Mandea on 20/09/2019.
//

import Foundation
import Combine

@available(OSX 10.15, iOS 13.0, *)
open class BaseService<T: ServiceConfiguration> {
    
    // MARK: - Variables
    
    open var session: URLSession
    open var configuration: T
    
    // MARK: - Init 
    
    public init(session: URLSession = URLSession.shared, configuration: T) {
        self.session = session
        self.configuration = configuration
    }
    
    // MARK: - Helpers
    
    public static func validate(_ data: Data, _ response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw RequestError.invalidResponse
        }
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw RequestError.statusCode(httpResponse.statusCode)
        }
        return data
    }
}

// MARK: - TaskPublisher

@available(OSX 10.15, iOS 13.0, watchOS 6.0, *)
extension BaseService: TaskPublisher {
    public func taskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher {
        return session.dataTaskPublisher(for: request)
    }
}
