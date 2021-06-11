//
//  SeatGeekEndpoint.swift
//  SeatGeekExercise
//
//  Created by Nicolas Le Gorrec on 6/10/21.
//

import Foundation

enum SeatGeekEndpoint: Endpoint {
    case getSearchResults(searchText: String, page: Int)
    
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "api.seatgeek.com"
        }
    }
    
    var path: String {
        switch self {
        case .getSearchResults:
            return "/2/events/"
        }
    }
    
    var parameters: [URLQueryItem] {
        let clientId = "MjIwMTUxNzB8MTYyMTk1ODM0My41MDIwMTA4"
        
        switch self {
        case .getSearchResults(let searchText, let page):
            return [URLQueryItem(name: "client_id", value: clientId),
                    URLQueryItem(name: "q", value: searchText),
                    URLQueryItem(name: "page", value: String(page))]
        }
    }
    
    var method: String {
        switch self {
        case .getSearchResults:
            return "GET"
        }
    }
}
