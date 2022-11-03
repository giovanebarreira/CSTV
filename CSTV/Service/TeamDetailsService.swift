//
//  TeamDetailsService.swift
//  CSTV
//
//  Created by Giovane Barreira on 30/10/22.
//

import Foundation

protocol TeamDetailsNetworking {
    typealias TeamDetailsResult = ((Result<[TeamDetails], NetworkError>) -> Void)
    func fetchTeamDetails(teamSlug: String, completion: @escaping TeamDetailsResult)
}

struct TeamDetailsService: TeamDetailsNetworking {
    private let service: Networking

    init(service: Networking) {
        self.service = service
    }

    func fetchTeamDetails(teamSlug: String, completion: @escaping TeamDetailsResult) {
        let endpoint = Endpoint()
        let url = endpoint.teamDetailsEndpoint(teamSlug: teamSlug)
        let headers =  [
            "accept": "application/json",
            "authorization": endpoint.apiKey
          ]

        service.fetchService(url: url, headers: headers, method: .get, completion: completion)
    }
}
