//
//  EventsTableViewCell.swift
//  SeatGeekExercise
//
//  Created by Nicolas Le Gorrec on 5/25/21.
//

import SDWebImage
import UIKit

class EventsTableViewCell: UITableViewCell {
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var heartImageView: UIImageView!
    
    // I could do an event computed property here and
    // manually set these in a didSet function.
    
    func setEvent(event: Event, isSaved: Bool) {
        self.eventTitleLabel.text = event.shortTitle
        self.eventLocationLabel.text = "\(event.venue.city), \(event.venue.state)"
        self.eventDateLabel.text = event.formatedDate
        self.eventImageView.sd_setImage(with: URL(string: event.performers[0].image))
        self.eventImageView.layer.cornerRadius = 10
        self.eventImageView.clipsToBounds = true
        self.heartImageView.isHidden = !isSaved
    }
}
