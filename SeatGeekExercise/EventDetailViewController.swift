//
//  EventDetailViewController.swift
//  SeatGeekExercise
//
//  Created by Nicolas Le Gorrec on 5/25/21.
//

import SDWebImage
import UIKit

class EventDetailViewController: UIViewController {
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    
    weak var delegate: EventsViewController!
    var savedEvent: Bool = false
    
    var heartType: String {
        if savedEvent {
           return "heart_fill"
        } else {
           return "heart"
        }
    }
    
    var event: Event? {
        didSet {
            configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: heartType), style: .plain, target: self, action: #selector(addTapped))

        configureView()
    }
    
    func configureView() {
        if let event = event,
           let eventTitleLabel = eventTitleLabel,
           let eventImageView = eventImageView,
           let eventDateLabel = eventDateLabel,
           let eventLocationLabel = eventLocationLabel
        {
            eventTitleLabel.text = event.shortTitle
            eventDateLabel.text = event.formatedDate
            eventLocationLabel.text = "\(event.venue.city), \(event.venue.state)"
            eventImageView.sd_setImage(with: URL(string: event.performers[0].image))
        }
    }
    
    @objc func addTapped() {
        if (savedEvent) {
            delegate.removeSavedEvent(eventId: event?.id ?? 0)
            savedEvent = false
        } else {
            delegate.addSavedEvent(eventId: event?.id ?? 0)
            savedEvent = true
        }
        
        self.viewDidLoad()
    }
}
