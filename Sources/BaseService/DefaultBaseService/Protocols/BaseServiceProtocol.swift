//
//  BaseServiceProtocol.swift
//  
//
//  Created by Daniel Mandea on 28/09/2019.
//

import Foundation
import Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public protocol BaseServiceProtocol {
    func download(from url: URL) -> AnyPublisher<Data, Error>
}
