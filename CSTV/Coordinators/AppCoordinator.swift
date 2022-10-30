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
    }

    func start() {
        let matchesListCoordiantor = MatchesListCoordinator(navigationController: navigationController)
        matchesListCoordiantor.start()
    }
}
