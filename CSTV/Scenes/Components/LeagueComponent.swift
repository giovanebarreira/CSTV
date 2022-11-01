//
//  LeagueComponent.swift
//  CSTV
//
//  Created by Giovane Barreira on 01/11/22.
//

import UIKit

class LeagueComponent: UIView {
    private let badgeImage: UIImage
    private let leagueName: String

    private let leagueStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.spacing = 8
        stack.backgroundColor = .clear
        return stack
    }()

    private var badgeImageView: UIImageView {
        let badge = UIImageView()
        badge.translatesAutoresizingMaskIntoConstraints = false
        badge.contentMode = .scaleAspectFit
        badge.layer.cornerRadius = badge.frame.height/2
        badge.clipsToBounds = true
        badge.image = badgeImage
        badge.backgroundColor = .systemBackground
        return badge
    }

    private var leagueText: UILabel {
        let league = UILabel()
        league.translatesAutoresizingMaskIntoConstraints = false
        league.font = .systemFont(ofSize: 8)
        league.textColor = .title
        league.text = leagueName
        return league
    }

    init(badgeImage: UIImage, leagueName: String) {
        self.badgeImage = badgeImage
        self.leagueName = leagueName
        super.init(frame: .zero)

        addSubview(leagueStackView)
        leagueStackView.addArrangedSubview(badgeImageView)
        leagueStackView.addArrangedSubview(leagueText)
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
