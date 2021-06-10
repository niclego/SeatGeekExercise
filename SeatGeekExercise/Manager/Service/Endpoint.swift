//
//  Endpoint.swift
//  SeatGeekExercise
//
//  Created by Nicolas Le Gorrec on 6/10/21.
//

import Foundation

protocol Endpoint {
    // HTTP or HTTPS
    var scheme: String { get }
    
    // Example: "api.flickr.com"
    var baseURL: String { get }
    
    // "/services/rest/
    var path: String { get }
    
    // [URLQueryItem(name: "api_key", value: API_KEY)]
    var parameters: [URLQueryItem] { get }
    
    // "GET"
    var method: String { get }
}
