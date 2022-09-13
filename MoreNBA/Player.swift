//
//  Player.swift
//  MoreNBA
//
//  Created by Oleh Pauk on 01.09.2022.
//

import Foundation

struct PlayersResponse: Decodable {
    let data: [Player]
}

struct Player: Decodable {
    let firstName: String
    let lastName: String
    
    let team: Team
    let position: String
    
    let heightFeet: Int?
    let heightInches: Int?
    
    var heigh: String {
        if let heightFeet = heightFeet, let heightInches = heightInches {
            return "\(heightFeet)'\(heightInches)''"
        } else {
            return "Unknown"
        }
    }
    
    var fullName: String {
        firstName + " " + lastName
    }
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case position = "position"
        case team = "team"
        case heightFeet = "height_feet"
        case heightInches = "height_inches"
    }
}



let lakers = Team(name: "Lakers", city: "Los Angeles", conference: "West")
let heat = Team(name: "Heat", city: "Miami", conference: "East")
