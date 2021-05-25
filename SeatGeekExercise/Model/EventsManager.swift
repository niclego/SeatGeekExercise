//
//  EventManager.swift
//  SeatGeekExercise
//
//  Created by Nicolas Le Gorrec on 5/25/21.
//

import Foundation

protocol EventsManagerDelegate {
    func didUpdateEvents(_ eventsManager: EventsManager, events: Events)
    func didFailWithError(error: Error)
}

struct EventsManager {
    let eventUrl = "https://api.seatgeek.com/2/events/?client_id=MjIwMTUxNzB8MTYyMTk1ODM0My41MDIwMTA4"
    
    var delegate: EventsManagerDelegate?
    
    func fetchEvents(queryString: String) {
        let urlString = "\(eventUrl)&q=\(queryString)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let events = parseJSON(safeData) {
                        delegate?.didUpdateEvents(self, events: events)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ eventsData: Data) -> Events? {
        let decoder = JSONDecoder()
        
        do {
            let events = try decoder.decode(Events.self, from: eventsData)
            return events
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
