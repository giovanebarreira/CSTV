//
//  TeamDetailsViewController.swift
//  CSTV
//
//  Created by Giovane Barreira on 02/11/22.
//

import UIKit

final class TeamDetailsViewController: UIViewController {

    private var viewModel: TeamDetailsViewModelOutput

    // Components
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 0
        return stack
    }()

    private let versusLabel: UILabel = {
        let titleLbl = UILabel()
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.font = UIFont.preferredFont(forTextStyle: .body)
        titleLbl.text = "vs"
        titleLbl.textColor = .subtitle
        return titleLbl
    }()

    var team1StackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .trailing
        stack.backgroundColor = .clear
        stack.layer.cornerRadius = 12
        stack.spacing = 13
        return stack
    }()

    var team2StackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .leading
        stack.backgroundColor = .clear
        stack.layer.cornerRadius = 12
        stack.spacing = 13
        return stack
    }()

    let timeView = TimeView()
    var team1Component = BadgeComponent()
    var team2Component = BadgeComponent()
    var league = LeagueComponent()

    init(viewModel: TeamDetailsViewModelOutput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        viewModel.delegate = self
        viewModel.fetchTeamsData()
    }

    private func fillComponentsProperties() {
        navigationItem.title = viewModel.teamDetailsDisplay?.selectedMatch.leagueAndSerie
        guard let match = viewModel.teamDetailsDisplay?.selectedMatch,
              let team1 = viewModel.teamDetailsDisplay?.team1,
              let team2 = viewModel.teamDetailsDisplay?.team2
        else { return }

        timeView.timeString = match.matchTime
        timeView.timeLabel.font = .boldSystemFont(ofSize: 14)

        team1Component.name = match.team1Name
        team1Component.teamImage = match.team1Bagde
        team2Component.name = match.team2Name
        team2Component.teamImage = match.team2Bagde

        league.badgeImage = match.leagueBadge
        league.leagueName = match.leagueAndSerie

        team1.forEach { player in
            let playerDisplay = PlayerView()
            playerDisplay.makeLeftPlayerDisplay(player: player)
            team1StackView.addArrangedSubview(playerDisplay)
        }

        team2.forEach { player in
            let playerDisplay = PlayerView()
            playerDisplay.makeRightPlayerDisplay(player: player)
            team2StackView.addArrangedSubview(playerDisplay)
        }

        setupComponents()
    }

    private func setupComponents() {
        view.backgroundColor = .background

        view.addSubview(stackView)
        stackView.addArrangedSubview(team1Component)
        stackView.addArrangedSubview(versusLabel)
        stackView.addArrangedSubview(team2Component)
        view.addSubview(timeView.timeLabel)
        view.addSubview(team1StackView)
        view.addSubview(team2StackView)

        // stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 14),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 14),
            stackView.heightAnchor.constraint(equalToConstant: 140)
        ])

        // time
        NSLayoutConstraint.activate([
            timeView.timeLabel.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 0),
            timeView.timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // team1StackView
        NSLayoutConstraint.activate([
            team1StackView.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 6),
            team1StackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 0),
        ])

        // team2StackView
        NSLayoutConstraint.activate([
            team2StackView.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 6),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: team2StackView.trailingAnchor, multiplier: 0),
        ])
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
        DispatchQueue.main.async {
            self.showAlert(errorMessage: error, callback: self.alertCallback)
        }
    }

    func displayTeams() {
        DispatchQueue.main.async {
            self.fillComponentsProperties()
        }
    }
}
