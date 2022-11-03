//
//  MatcheListServiceMock.swift
//  CSTVTests
//
//  Created by Giovane Barreira on 03/11/22.
//

import Foundation
@testable import CSTV

final class MatchesListServiceMock: MatchesListNetworking {
    var isFetchingError = false

    func fetchMatches(page: Int, completion: @escaping MatchesList) {
        let path = Bundle.main.url(forResource: "matchesList", withExtension: "json")!

        if isFetchingError {
          return completion(.failure(.serverError))
        }

        let data = try! Data(contentsOf: path, options: .mappedIfSafe)
        let results = try! JSONDecoder().decode([Match].self, from: data)
        return completion(.success(results))
    }
}
