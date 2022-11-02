//
//  TeamDetailsViewController.swift
//  CSTV
//
//  Created by Giovane Barreira on 02/11/22.
//

import UIKit

final class TeamDetailsViewController: UIViewController {

    private var viewModel: TeamDetailsViewModelOutput

    private let stackView: UIStackView = {
      let stack = UIStackView()
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.axis = .horizontal
      stack.alignment = .top
      stack.distribution = .fillEqually
      stack.spacing = 4
      return stack
    }()

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
        viewModel.delegate = self
        viewModel.fetchTeamsData()
    }

    private func setupComponents() {

    }
}

extension TeamDetailsViewController: TeamDetailsDelegate {
    func showSpinner(_ isLoading: Bool) {
        DispatchQueue.main.async {
            isLoading ? self.showSpinner() : self.removeSpinner()
        }
    }

    private func alertCallback() {
        self.viewModel.fetchTeamsData()
    }

    func didFail(error: String) {
        self.showAlert(errorMessage: error, callback: self.alertCallback)
    }

    func displayTeams() {
        DispatchQueue.main.async {
            self.setupComponents()
        }
    }
}
