//
//  MatchesListCoordinator.swift
//  CSTV
//
//  Created by Giovane Barreira on 30/10/22.
//

import UIKit

protocol MatchesListCoordinated {
    func goToMatchDetails(competitors: Competitors)
}

final class MatchesListCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let service = NetworkService()
        let matchesListservice = MatchesListService(service: service)
        let viewModel = MatchesListViewModel(matchesListService: matchesListservice)
        let viewController = MatchesListViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension MatchesListCoordinator: MatchesListCoordinated {
    func goToMatchDetails(competitors: Competitors) {
        print(competitors)
    }
}
