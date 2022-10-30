//
//  NetworkService.swift
//  CSTV
//
//  Created by Giovane Barreira on 30/10/22.
//

import Foundation

protocol Networking {
    typealias Fetch<T: Decodable> = ((Result<T, NetworkError>) -> Void)
    func fetchService<T: Decodable>(url: String, headers: [String: String], method: HttpMethod, completion: @escaping Fetch<T>)
}

struct NetworkService: Networking {
    func fetchService<T>(url: String, headers: [String: String], method: HttpMethod = .get, completion: @escaping Fetch<T>) where T : Decodable {
        guard let url = URL(string: url) else {
            return completion(.failure(.invalidURL(url)))
        }

        let headers = headers
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue
        print("URL>>>", url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                guard let data = data else {
                    return completion(.failure(.serverError))
                }

                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                   return completion(.failure(.badResponse))
                }

                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch (let error){
                print(error.localizedDescription)
                completion(.failure(.decodingError))
            }
        }
        .resume()
    }
}
