//
//  MatchesListCoordinator.swift
//  CSTV
//
//  Created by Giovane Barreira on 30/10/22.
//

import UIKit

protocol MatchesListCoordinated {
    //func goToMatchDetails(selectedMatch)
}

final class MatchesListCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = MatchesListViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension MatchesListCoordinator: MatchesListCoordinated {
    
}
