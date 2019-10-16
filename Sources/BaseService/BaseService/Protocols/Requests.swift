//
//  File.swift
//  
//
//  Created by Daniel Mandea on 22/09/2019.
//

import Foundation
import Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public protocol Requests {
    func fetch<T: Codable>(with request: URLRequest) -> AnyPublisher<T, Error>
    func fetch<T: Codable>(with method: HttpMethod, path: String?, object: T?) -> AnyPublisher<T, Error>
    func get<T: Codable>(from path: String?) -> AnyPublisher<T, Error>
    func post<T: Codable>(to path: String?, object: T?) -> AnyPublisher<T, Error>
}
