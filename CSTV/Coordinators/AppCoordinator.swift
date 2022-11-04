//
//  AppCoordinator.swift
//  CSTV
//
//  Created by Giovane Barreira on 30/10/22.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    let window: UIWindow

    var rootViewController: UIViewController { navigationController }

    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
        setupNavigationLayout()
    }

    func start() {
        navigationController.pushViewController(LaunchView(), animated: true)
        let matchesListCoordinator = MatchesListCoordinator(navigationController: navigationController)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
            self.navigationController.viewControllers.removeAll()
            matchesListCoordinator.start()
        }
    }

    private func setupNavigationLayout() {
        navigationController.navigationBar.prefersLargeTitles = true

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .background
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.title]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.title]
        appearance.shadowColor = .clear

        navigationController.navigationBar.tintColor = .title
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
    }
}
