//
//  MatchesListCoordinator.swift
//  CSTV
//
//  Created by Giovane Barreira on 30/10/22.
//

import UIKit

protocol MatchesListCoordinated {
    func goToMatchDetails(competitors: [Competitors])
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
        viewController.coordinatorDelegate = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension MatchesListCoordinator: MatchesListCoordinated {
    func goToMatchDetails(competitors: [Competitors]) {
        print(competitors)

        let teamDetailsCoordinator = TeamDetailsCoordinator(navigationController: navigationController, competitors: competitors)
        teamDetailsCoordinator.start()
    }
}
