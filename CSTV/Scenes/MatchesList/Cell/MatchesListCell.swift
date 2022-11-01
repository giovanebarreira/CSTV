//
//  MatchesListCell.swift
//  CSTV
//
//  Created by Giovane Barreira on 31/10/22.
//

import UIKit
import Kingfisher

final class MatchesListCell: UITableViewCell {
    static let reuseId = "MatchesListCell"
    static let estimatedRowHeight: CGFloat = 200

    private let baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cardColor
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = false
        return view
    }()

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 0
        stack.backgroundColor = .clear
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

    private func badgeStackView() -> UIStackView {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 10
        stack.backgroundColor = .clear
        return stack
    }

    private func badgeImage(teamImage: UIImage) -> UIImageView {
        let badgeImage = UIImageView()
        badgeImage.translatesAutoresizingMaskIntoConstraints = false
        badgeImage.contentMode = .scaleAspectFit
        badgeImage.layer.cornerRadius = badgeImage.frame.height/2
        badgeImage.clipsToBounds = true
        badgeImage.image = teamImage
        badgeImage.backgroundColor = .systemBackground
        return badgeImage
    }

    private func makeLabel(with text: String) -> UILabel {
        let teamLabel = UILabel()
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        teamLabel.font = .preferredFont(forTextStyle: .caption1)
        teamLabel.textColor = .title
        teamLabel.text = text
        return teamLabel
    }

    private var team1: UIStackView {
        let badge = badgeImage(teamImage: UIImage(systemName: "person")!)
        let name = makeLabel(with: "Time 1")
        let stackView = badgeStackView()

        stackView.addArrangedSubview(badge)
        stackView.addArrangedSubview(name)
        return stackView
    }

    private var team2: UIStackView {
        let badge = badgeImage(teamImage: UIImage(systemName: "person")!)
        let name = makeLabel(with: "Time 2")
        let stackView = badgeStackView()

        stackView.addArrangedSubview(badge)
        stackView.addArrangedSubview(name)
        return stackView
    }

    private var divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .scheduleTime
        return view
    }()

    private var leagueComponent = LeagueComponent(badgeImage: UIImage(systemName: "photo")!, leagueName: "League + serie")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    

    private func setup() {
        contentView.backgroundColor = .background
        contentView.addSubview(baseView)
        baseView.addSubview(stackView)
        stackView.addArrangedSubview(team1)
        stackView.addArrangedSubview(versusLabel)
        stackView.addArrangedSubview(team2)
        baseView.addSubview(divider)
        baseView.addSubview(leagueComponent)

     // TODO: remove
        stackView.backgroundColor = .lightGray
    }

    private func setupViewLayout() {
        // Base view
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 3),
            baseView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3),
            trailingAnchor.constraint(equalToSystemSpacingAfter: baseView.trailingAnchor, multiplier: 3),
            bottomAnchor.constraint(equalToSystemSpacingBelow: baseView.bottomAnchor, multiplier: 0)
        ])

        // Stack view
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: baseView.topAnchor, multiplier: 4),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: baseView.leadingAnchor, multiplier: 10),
            baseView.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 10),
            baseView.bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 5)
        ])

        // Divider
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            divider.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: divider.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 1)
        ])

        // League component
        NSLayoutConstraint.activate([
            leagueComponent.topAnchor.constraint(equalToSystemSpacingBelow: divider.bottomAnchor, multiplier: 1),
            leagueComponent.leadingAnchor.constraint(equalToSystemSpacingAfter: baseView.leadingAnchor, multiplier: 2),
            baseView.trailingAnchor.constraint(equalToSystemSpacingAfter: leagueComponent.trailingAnchor, multiplier: 0),
            baseView.bottomAnchor.constraint(equalToSystemSpacingBelow: leagueComponent.bottomAnchor, multiplier: 2)
        ])
    }
}


