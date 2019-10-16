//
//  File.swift
//  
//
//  Created by Daniel Mandea on 20/09/2019.
//

import Foundation

public struct DefaultServiceConfiguration: ServiceConfiguration {
    
    // MARK - Public
    
    public var baseUrl: URL
    
    // MARK: - Init
    
    public init(baseUrl: URL ) {
        self.baseUrl = baseUrl
    }
}
