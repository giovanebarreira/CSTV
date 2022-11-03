//
//  BadgeComponent.swift
//  CSTV
//
//  Created by Giovane Barreira on 01/11/22.
//

import UIKit
import Kingfisher

final class BadgeComponent: UIStackView {
    var teamImage: String = "" {
        didSet {
            downloadImage(teamImage)
        }
    }

    var name: String = "" {
        didSet {
            teamName.text = name
        }
    }

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var badgeImage: UIImageView = {
        let badgeImage = UIImageView()
        badgeImage.translatesAutoresizingMaskIntoConstraints = false
        badgeImage.contentMode = .scaleAspectFit
        badgeImage.layer.masksToBounds = true
        badgeImage.clipsToBounds = true
        badgeImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        badgeImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        return badgeImage
    }()

    var teamName: UILabel = {
        let teamLabel = UILabel()
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        teamLabel.font = .systemFont(ofSize: 10)
        teamLabel.textColor = .title
        return teamLabel
    }()

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        distribution = .equalSpacing
        alignment = .center
        spacing = 10
        backgroundColor = .clear

        addArrangedSubview(badgeImage)
        addArrangedSubview(teamName)
    }

    private func downloadImage(_ imageURL: String) {
        guard let thumbnailURL = URL(string: imageURL) else { return }
        let resource = ImageResource(downloadURL: thumbnailURL, cacheKey: imageURL)
        badgeImage.kf.indicatorType = .activity
        badgeImage.kf.setImage(with: resource)
    }
}
