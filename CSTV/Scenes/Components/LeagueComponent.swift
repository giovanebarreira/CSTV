//
//  LeagueComponent.swift
//  CSTV
//
//  Created by Giovane Barreira on 01/11/22.
//

import UIKit
import Kingfisher

final class LeagueComponent: UIStackView {
    var badgeImage: String = "" {
        didSet {
            downloadImage(badgeImage)
            badgeImageView.backgroundColor = badgeImage == "" ? .placeholder : .clear
        }
    }

    var leagueName: String = "" {
        didSet {
            leagueText.text = leagueName
        }
    }

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        distribution = .fillProportionally
        alignment = .leading
        spacing = 8
        backgroundColor = .clear
        addArrangedSubview(badgeImageView)
        addArrangedSubview(leagueText)
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        badgeImageView.layer.cornerRadius = (badgeImageView.frame.size.width ) / 2
        badgeImageView.clipsToBounds = true
    }
    
    var badgeImageView: UIImageView = {
        let badge = UIImageView()
        badge.translatesAutoresizingMaskIntoConstraints = false
        badge.contentMode = .scaleAspectFit
        badge.layer.masksToBounds = false
        badge.widthAnchor.constraint(equalToConstant: 16).isActive = true
        badge.heightAnchor.constraint(equalToConstant: 16).isActive = true
        return badge
    }()

    var leagueText: UILabel = {
        let league = UILabel()
        league.translatesAutoresizingMaskIntoConstraints = false
        league.font = .systemFont(ofSize: 10)
        league.textColor = .title
        return league
    }()

    private func downloadImage(_ imageURL: String) {
        guard let thumbnailURL = URL(string: imageURL) else { return }
        let resource = ImageResource(downloadURL: thumbnailURL, cacheKey: imageURL)
        badgeImageView.kf.indicatorType = .activity
        badgeImageView.kf.setImage(with: resource)
    }
}
