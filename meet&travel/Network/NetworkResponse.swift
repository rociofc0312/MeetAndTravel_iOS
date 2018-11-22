//
//  NetworkResponse.swift
//  meet&travel
//
//  Created by Developer User on 11/20/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct NetworkResponse: Codable {
    var message: String?
    var events: [Event]?
    var status: String?
    var user: User?
    var token: String?
}

	
