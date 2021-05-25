//
//  Event.swift
//  SeatGeekExercise
//
//  Created by Nicolas Le Gorrec on 5/25/21.
//

import Foundation

struct Events: Codable {
    let events: [Event]
}

struct Event: Codable {
    let id: Int
    let shortTitle: String
    let datetimeUtc: String
    let venue: Venue
    let performers: [Performer]
    
    var formatedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let myDate = dateFormatter.date(from: datetimeUtc)!
        
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy h:mm a"
        dateFormatter.timeZone = NSTimeZone.local
        let somedateString = dateFormatter.string(from: myDate)
        return somedateString
    }
    
    enum CodingKeys: String, CodingKey {
        case shortTitle = "short_title"
        case datetimeUtc = "datetime_utc"
        case venue = "venue"
        case performers = "performers"
        case id = "id"
    }
}

struct Venue: Codable {
    let state: String
    let country: String
    let city: String
}

struct Performer: Codable {
    let image: String
}
