//
//  MatchesListService.swift
//  CSTV
//
//  Created by Giovane Barreira on 30/10/22.
//

import Foundation

protocol MatchesListNetworking {
    typealias MatchesList = ((Result<[Match], NetworkError>) -> Void)
    func fetchMatches(page: Int, completion: @escaping MatchesList)
}

struct MatchesListService: MatchesListNetworking {
     private let service: Networking

    init(service: Networking) {
        self.service = service
    }

    func fetchMatches(page: Int, completion: @escaping MatchesList) {
        let endpoint = Endpoint()
        let url = endpoint.upcomingMatchesEndpoint(page: page)
        let headers =  [
            "accept": "application/json",
            "authorization": endpoint.apiKey
          ]
        
        service.fetchService(url: url, headers: headers, method: .get, completion: completion)
    }
}
