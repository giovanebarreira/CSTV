//
//  LeagueComponent.swift
//  CSTV
//
//  Created by Giovane Barreira on 01/11/22.
//

import UIKit
import Kingfisher

class LeagueComponent: UIView {
    var badgeImage: String
    var leagueName: String

    init(badgeImage: String, leagueName: String) {
        self.badgeImage = badgeImage
        self.leagueName = leagueName
        super.init(frame: .zero)
        downloadImage(badgeImage)
        
        addSubview(leagueStackView)
        leagueStackView.addArrangedSubview(badgeImageView)
        leagueStackView.addArrangedSubview(leagueText)
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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

    private func downloadImage(_ imageURL: String) {
        guard let thumbnailURL = URL(string: imageURL) else { return }
        let resource = ImageResource(downloadURL: thumbnailURL, cacheKey: imageURL)
        badgeImageView.kf.indicatorType = .activity
        badgeImageView.kf.setImage(with: resource)
    }
}
