//
//  NbaPlayer.swift
//  TestHype
//
//  Created by ulixe on 08/09/2021.
//

import Foundation

struct NbaPlayer: Decodable {
    var id: Int?
    var firstName: String?
    var lastName: String?
    var position: String?
    var team: NbaTeam?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case position = "position"
        case team = "team"
    }
}
