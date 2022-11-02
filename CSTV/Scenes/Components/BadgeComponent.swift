//
//  BadgeComponent.swift
//  CSTV
//
//  Created by Giovane Barreira on 01/11/22.
//

import UIKit
import Kingfisher

class BadgeComponent: UIStackView {
    var teamImage: String
    var name: String

    init(teamImage: String, name: String) {
        self.teamImage = teamImage
        self.name = name
        super.init(frame: .zero)
        downloadImage(teamImage)
        setup()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var badgeImage: UIImageView {
        let badgeImage = UIImageView()
        badgeImage.translatesAutoresizingMaskIntoConstraints = false
        badgeImage.contentMode = .scaleAspectFit
        badgeImage.layer.cornerRadius = badgeImage.frame.height/2
        badgeImage.clipsToBounds = true
        badgeImage.backgroundColor = .systemBackground
        return badgeImage
    }

    private var teamName: UILabel {
        let teamLabel = UILabel()
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        teamLabel.font = .systemFont(ofSize: 8)
        teamLabel.textColor = .title
        teamLabel.text = name
        return teamLabel
    }

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
