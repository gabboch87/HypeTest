//
//  GetAllPlayersResponse.swift
//  TestHype
//
//  Created by ulixe on 08/09/2021.
//

import Foundation

struct GetAllPlayersResponse: Decodable {
    var data: [NbaPlayer]
    var meta: MetaData
}
