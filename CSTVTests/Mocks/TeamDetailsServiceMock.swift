//
//  TeamDetailsServiceMock.swift
//  CSTVTests
//
//  Created by Giovane Barreira on 03/11/22.
//

import Foundation
@testable import CSTV

final class TeamDetailsServiceMock: TeamDetailsNetworking {
    var isFetchingError = false
    var pathType: PathType = .team1

    func fetchTeamDetails(teamSlug: String, completion: @escaping TeamDetailsResult) {
        let path = Bundle.main.url(forResource: pathType.rawValue, withExtension: "json")!

        if isFetchingError {
          return completion(.failure(.serverError))
        }

        let data = try! Data(contentsOf: path, options: .mappedIfSafe)
        let results = try! JSONDecoder().decode([TeamDetails].self, from: data)
        return completion(.success(results))
    }
}
