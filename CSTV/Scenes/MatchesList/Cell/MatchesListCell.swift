//
//  MatchesListCell.swift
//  CSTV
//
//  Created by Giovane Barreira on 31/10/22.
//

import UIKit

final class MatchesListCell: UITableViewCell {
    static let reuseId = "MatchesListCell"
    static let estimatedRowHeight: CGFloat = 200

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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

    private var divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .scheduleTime
        return view
    }()


    func configure(match: MatchesListDisplay) {
        var timeView = TimeView(timeString: match.matchTime, isNow: match.matchTimeIsNow)
        var team1 = BadgeComponent(teamImage: match.team1Bagde, name: match.team1Name)
        var team2 = BadgeComponent(teamImage: match.team2Bagde, name: match.team2Name)
        var league = LeagueComponent(badgeImage: match.leagueBadge, leagueName: match.leagueAndSerie)
        
        setupViewLayout(timeView: timeView, team1: team1, team2: team2, league: league)
    }

    private func setupViewLayout(timeView: TimeView, team1: BadgeComponent, team2: BadgeComponent, league: LeagueComponent) {

        contentView.backgroundColor = .background
        contentView.addSubview(baseView)
        baseView.addSubview(timeView)
        baseView.addSubview(stackView)
        stackView.addArrangedSubview(team1)
        stackView.addArrangedSubview(versusLabel)
        stackView.addArrangedSubview(team2)
        baseView.addSubview(divider)
        baseView.addSubview(league)


        // Base view
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 3),
            baseView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3),
            trailingAnchor.constraint(equalToSystemSpacingAfter: baseView.trailingAnchor, multiplier: 3),
            bottomAnchor.constraint(equalToSystemSpacingBelow: baseView.bottomAnchor, multiplier: 0)
        ])

        // Time view
        NSLayoutConstraint.activate([
            timeView.topAnchor.constraint(equalToSystemSpacingBelow: baseView.topAnchor, multiplier: 0),
            baseView.trailingAnchor.constraint(equalToSystemSpacingAfter: timeView.trailingAnchor, multiplier: 0),
            timeView.widthAnchor.constraint(equalToConstant: 58),
            timeView.heightAnchor.constraint(equalToConstant: 28)
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
            league.topAnchor.constraint(equalToSystemSpacingBelow: divider.bottomAnchor, multiplier: 1),
            league.leadingAnchor.constraint(equalToSystemSpacingAfter: baseView.leadingAnchor, multiplier: 2),
            baseView.trailingAnchor.constraint(equalToSystemSpacingAfter: league.trailingAnchor, multiplier: 0),
            baseView.bottomAnchor.constraint(equalToSystemSpacingBelow: league.bottomAnchor, multiplier: 2)
        ])
    }
}
