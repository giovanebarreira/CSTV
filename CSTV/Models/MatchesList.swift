//
//  MatchesList.swift
//  CSTV
//
//  Created by Giovane Barreira on 30/10/22.
//


import Foundation

struct UpcomingMatches: Codable {
    let beginAt: String
    let league: League
    let competitors: [Competitors]
    let serie: Serie

    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case league
        case competitors = "opponents"
        case serie
    }
}


struct League: Codable {
    let id: Int
    let imageURL: String?
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image_url"
        case name
    }
}

struct Competitors: Codable {
    let opponent: Opponent
}

struct Opponent: Codable {
    let id: Int?
    let imageURL: String?
    let name: String
    let slug: String

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image_url"
        case name
        case slug
    }
}

struct Serie: Codable {
    let fullName: String

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
    }
}

