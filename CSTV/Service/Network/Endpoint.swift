//
//  Endpoint.swift
//  CSTV
//
//  Created by Giovane Barreira on 30/10/22.
//

import Foundation

struct Endpoint {
    private let baseUrl = "https://api.pandascore.co/csgo/"
    private let baseImageURL = "https://cdn.pandascore.co/images/"
    private let upcomingMatches = "matches/upcoming"
    private let teams = "teams?search[slug]"

    func upcomingMatchesEndpoint(page: Int = 1) -> String {
        return "\(baseUrl)\(upcomingMatches)?sort=begin_at&page=\(page)&per_page=10"
    }

    func teamDetailsEndpoint(teamSlug: String) -> String {
        return "\(baseUrl)\(teams)=\(teamSlug)"
    }
}
