//
//  NetowrkServiceMock.swift
//  CSTVTests
//
//  Created by Giovane Barreira on 03/11/22.
//

import Foundation
@testable import CSTV

enum PathType: String {
    case matchesList
    case team1
    case team2
}

final class NetworkServiceMock: Networking {
    var isFetchingError = false
    var pathType: PathType = .matchesList

    func fetchService<T>(url: String, headers: [String : String], method: CSTV.HttpMethod, completion: @escaping Fetch<T>) where T : Decodable {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(1)) {
            if self.isFetchingError {
                return completion(.failure(.badResponse))
            }

            let path = Bundle.main.url(forResource: self.pathType.rawValue, withExtension: "json")!
            let data = try! Data(contentsOf: path, options: .mappedIfSafe)
            let results = try! JSONDecoder().decode(T.self, from: data)

            return completion(.success(results))
        }
    }
}
