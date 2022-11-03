//
//  TeamDetails.swift
//  CSTV
//
//  Created by Giovane Barreira on 30/10/22.
//

import Foundation

struct TeamDetails: Codable, Equatable {
    static func == (lhs: TeamDetails, rhs: TeamDetails) -> Bool {
        lhs.name == rhs.name
    }

    let imageURL: String
    let name: String
    let players: [Player]

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case name
        case players
    }
}

struct Player: Codable {
    let firstName: String?
    let imageURL: String?
    let lastName: String?
    let nickname: String

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case imageURL = "image_url"
        case lastName = "last_name"
        case nickname = "name"
    }
}
