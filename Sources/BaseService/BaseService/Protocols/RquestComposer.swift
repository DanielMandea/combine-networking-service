//
//  RequestComposer.swift
//  
//
//  Created by Daniel Mandea on 27/09/2019.
//

import Foundation

public protocol RequestComposer {
    func decodableRquest<T: Codable>(with method: HttpMethod, path: String?, object: T?, headers: [String: String]?) -> URLRequest
    func dataRquest(with method: HttpMethod, path: String?, object: Data, headers: [String: String]?) -> URLRequest
    func request(with method: HttpMethod, path: String?, headers: [String: String]?) -> URLRequest
}
