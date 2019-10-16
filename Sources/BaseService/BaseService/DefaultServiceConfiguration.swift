//
//  File.swift
//  
//
//  Created by Daniel Mandea on 20/09/2019.
//

import Foundation

open struct DefaultServiceConfiguration: ServiceConfiguration {
    
    // MARK - Public
    
    open var baseUrl: URL
    
    // MARK: - Init
    
    open init(baseUrl: URL ) {
        self.baseUrl = baseUrl
    }
}
