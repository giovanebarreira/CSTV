//
//  TeamDetailsCoordinator.swift
//  CSTV
//
//  Created by Giovane Barreira on 02/11/22.
//

import UIKit

final class TeamDetailsCoordinator: Coordinator {
    var navigationController: UINavigationController
    let selectedMatch: MatchesListDisplay

    init(navigationController: UINavigationController, selectedMatch: MatchesListDisplay) {
        self.navigationController = navigationController
        self.selectedMatch = selectedMatch
    }

    func start() {
        let networkService = NetworkService()
        let service = TeamDetailsService(service: networkService)
        let viewModel = TeamDetailsViewModel(service: service, selectedMatch: selectedMatch)
        let viewController = TeamDetailsViewController(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
