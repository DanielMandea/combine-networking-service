//
//  RequestError.swift
//  
//
//  Created by Daniel Mandea on 20/09/2019.
//

import Foundation

public enum RequestError: Error {
    case invalidBody
    case invalidEndpoint
    case invalidURL
    case emptyData
    case invalidJSON
    case invalidResponse
    case statusCode(Int)
}
