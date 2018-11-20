//
//  Event.swift
//  meet&travel
//
//  Created by Developer User on 11/20/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct Event: Codable {
    var id: Int?
    var name: String?
    var organizedBy: String?
    var description: String?
    var startDate: String?
    var endDate: String?
    var startHour: String?
    var endHour: String?
    var location: String?
    var eventImage: String?
    var userId: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case organizedBy = "organized_by"
        case description
        case startDate = "start_date"
        case endDate = "end_date"
        case startHour = "start_hour"
        case endHour = "end_hour"
        case location
        case eventImage = "event_image"
        case userId = "user_id"
    }
}

