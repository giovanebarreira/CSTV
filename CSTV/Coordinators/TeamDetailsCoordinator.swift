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
        setupNavigationLayout()
    }

    func start() {
        let networkService = NetworkService()
        let service = TeamDetailsService(service: networkService)
        let viewModel = TeamDetailsViewModel(service: service, selectedMatch: selectedMatch)
        let viewController = TeamDetailsViewController(viewModel: viewModel)

        navigationController.pushViewController(viewController, animated: true)
    }

    private func setupNavigationLayout() {
        navigationController.navigationBar.prefersLargeTitles = false
        navigationController.navigationItem.backButtonDisplayMode = .minimal

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .background
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.title]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.title]
        appearance.shadowColor = .clear
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
    }
}
