//
//  AllEventCell.swift
//  meet&travel
//
//  Created by Developer User on 11/20/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class AllEventCell: UITableViewCell {

    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(from event: Event){
        eventImageView.setImageFrom(urlString: event.eventImage!, withDefaultNamed: "no-image", withErrorNamed: "no-image")
        eventNameLabel.text = event.name
    }
}
