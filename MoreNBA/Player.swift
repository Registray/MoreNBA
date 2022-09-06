//
//  Player.swift
//  MoreNBA
//
//  Created by Oleh Pauk on 01.09.2022.
//

import Foundation

struct Player {
    let firstname: String
    let lastname: String
    let team: Team
    let position: String
    let height: String
    
    var fullName: String {
        firstname + " " + lastname
    }
}



let lakers = Team(name: "Lakers", city: "Los Angeles", conference: "West")
let heat = Team(name: "Heat", city: "Miami", conference: "East")
