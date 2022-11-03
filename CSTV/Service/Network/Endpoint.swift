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

    var apiKey: String {
      guard let filePath = Bundle.main.path(forResource: "CSTV", ofType: "plist") else { return "" }
      let plist = NSDictionary(contentsOfFile: filePath)
      guard let value = plist?.object(forKey: "API_KEY") as? String else { return ""}
      return value
    }

    func upcomingMatchesEndpoint(page: Int = 1) -> String {
        return "\(baseUrl)\(upcomingMatches)?sort=begin_at&page=\(page)&per_page=30"
    }

    func teamDetailsEndpoint(teamSlug: String) -> String {
        return "\(baseUrl)\(teams)=\(teamSlug)"
    }
}
