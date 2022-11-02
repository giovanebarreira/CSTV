//
//  TeamDetailsCoordinator.swift
//  CSTV
//
//  Created by Giovane Barreira on 02/11/22.
//

import UIKit

final class TeamDetailsCoordinator: Coordinator {
    var navigationController: UINavigationController
    let competitors: [Competitors]

    init(navigationController: UINavigationController, competitors: [Competitors]) {
        self.navigationController = navigationController
        self.competitors = competitors
    }

    func start() {
        let networkService = NetworkService()
        let service = TeamDetailsService(service: networkService)
        let viewModel = TeamDetailsViewModel(service: service, competitors: competitors)
        let viewController = TeamDetailsViewController(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
