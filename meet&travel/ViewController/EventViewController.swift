//
//  EventViewController.swift
//  meet&travel
//
//  Created by Developer User on 11/20/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var nameEventLabel: UILabel!
    @IBOutlet weak var descriptionEventLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var startHourLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var endHourLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let event = event {
            eventImageView.setImageFrom(urlString: event.eventImage!, withDefaultNamed: "no-image", withErrorNamed: "no-image")
            companyLabel.text = event.organizedBy
            nameEventLabel.text = event.name
            descriptionEventLabel.text = event.description
            startDateLabel.text = event.startDate
            startHourLabel.text = event.startHour
            endDateLabel.text = event.endDate
            endHourLabel.text = event.endHour
            locationLabel.text = event.location
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
