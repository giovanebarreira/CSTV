//
//  TeamDetailsViewController.swift
//  CSTV
//
//  Created by Giovane Barreira on 02/11/22.
//

import UIKit

final class TeamDetailsViewController: UIViewController {

    private var viewModel: TeamDetailsViewModelOutput

    init(viewModel: TeamDetailsViewModelOutput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "add title"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan

        viewModel.fetchTeamDetails(slug: "onyx-talents")


    }
}
