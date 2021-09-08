//
//  NbaTeam.swift
//  TestHype
//
//  Created by ulixe on 08/09/2021.
//

import Foundation

struct NbaTeam: Decodable {
    var id: Int?
    var abbreviation: String?
    var city: String?
    var conference: String?
    var division: String?
    var fullName: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case abbreviation = "abbreviation"
        case city = "city"
        case conference = "conference"
        case division = "division"
        case fullName = "full_name"
        case name = "name"
    }
}

