//
//  User.swift
//  meet&travel
//
//  Created by Developer User on 11/21/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: Int?
    var firstname: String?
    var lastname: String?
    var email: String?
    var telephone: String?
    var dni: String?
    var birthdate: String?
    var password: String?
    var confirmPassword: String?
    var created_at: String?
    var updated_at: String?
    var exp: Int?
    enum CodingKeys: String, CodingKey {
        case id
        case firstname
        case lastname
        case email
        case telephone
        case dni
        case birthdate
        case password
        case confirmPassword = "confirm_password"
    }
}
