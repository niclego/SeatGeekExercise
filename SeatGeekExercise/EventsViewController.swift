//
//  EventsViewController.swift
//  SeatGeekExercise
//
//  Created by Nicolas Le Gorrec on 5/25/21.
//

import UIKit

class EventsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var eventsManager = EventsManager()
    var events = Events(events: [])

    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search events"
        navigationItem.searchController = searchController
        
        tableView.dataSource = self
        
        eventsManager.delegate = self
        eventsManager.fetchEvents(queryString: "")
        
        super.viewDidLoad()
    }
    
    // We are using this, tableView.delegate would use tableView(_:didSelectRowAt:)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "ShowEventDetailSegue",
            let indexPath = tableView.indexPathForSelectedRow,
            let eventDetailViewController = segue.destination as? EventDetailViewController
        else {
            return
        }

        let event = events.events[indexPath.row]
        eventDetailViewController.savedEvent = isSavedEvent(eventId: event.id)
        eventDetailViewController.event = event
        eventDetailViewController.delegate = self

        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    
    func isSavedEvent(eventId: Int) -> Bool {
        let defaults = UserDefaults.standard
        let isSaved = defaults.bool(forKey: "\(eventId)")
        return isSaved
    }
    
    func addSavedEvent(eventId: Int) {
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "\(eventId)")
        self.tableView.reloadData()
    }
    
    func removeSavedEvent(eventId: Int) {
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: "\(eventId)")
        self.tableView.reloadData()
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension EventsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = events.events[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventsTableViewCell") as! EventsTableViewCell
        let isSaved = isSavedEvent(eventId: event.id)
        cell.setEvent(event: event, isSaved: isSaved)
        return cell
    }
}

//MARK: - EventsManagerDelegate

extension EventsViewController: EventsManagerDelegate {
    func didUpdateEvents(_ eventsManager: EventsManager, events: Events) {
        DispatchQueue.main.async {
            self.events = events
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - UISearchResultsUpdating

extension EventsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let searchString = searchBar.text ?? ""
        eventsManager.fetchEvents(queryString: searchString)
    }
}
