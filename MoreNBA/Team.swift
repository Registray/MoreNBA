//
//  Team.swift
//  MoreNBA
//
//  Created by Oleh Pauk on 04.09.2022.
//

import Foundation


struct Team: Decodable {
    let name: String
    let city: String
    let conference: String
    
    var fullName: String {
        city + " " + name 
    }
}
