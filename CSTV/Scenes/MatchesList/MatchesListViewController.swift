//
//  ViewController.swift
//  CSTV
//
//  Created by Giovane Barreira on 30/10/22.
//

import UIKit

class MatchesListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        let service = NetworkService()
        let matches = MatchesListService(service: service)

        matches.fetchMatches(page: 1) { result in
            switch result {
            case .success(let list):
                print(list)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
