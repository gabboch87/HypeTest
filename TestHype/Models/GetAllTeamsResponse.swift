//
//  GetAllTeamsResponse.swift
//  TestHype
//
//  Created by ulixe on 08/09/2021.
//

import Foundation

struct GetAllTeamsResponse: Decodable {
    var data: [NbaTeam]
    var meta: MetaData
}

struct MetaData: Decodable {
    var totalPages: Int?
    var currentPage: Int?
    var nextPage: Int?
    var perPage: Int?
    var totalCount: Int64?
    
    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case currentPage = "current_page"
        case nextPage = "next_page"
        case perPage = "per_page"
        case totalCount = "total_count"
    }
}

