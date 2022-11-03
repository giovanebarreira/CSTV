//
//  PlayerView.swift
//  CSTV
//
//  Created by Giovane Barreira on 03/11/22.
//

import UIKit
import Kingfisher

final class PlayerView: UIView {
    private var nickname: String = ""{
        didSet {
            playerNickname.text = nickname
        }
    }

    private var name: String = ""{
        didSet {
            playerFullName.text = name
        }
    }

    private var playerImage: String = "" {
        didSet {
            downloadImage(playerImage)
        }
    }

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .cardColor
        layer.cornerRadius = 12
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var playerNickname: UILabel = {
        let titleLbl = UILabel()
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.font = .boldSystemFont(ofSize: 14)
        titleLbl.text = "Nickname"
        titleLbl.textColor = .title
        return titleLbl
    }()

    var playerFullName: UILabel = {
        let titleLbl = UILabel()
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.font = .systemFont(ofSize: 12)
        titleLbl.text = "name"
        titleLbl.textColor = .subtitle
        return titleLbl
    }()

    var thumbnail: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.backgroundColor = .placeholder
        imageView.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        imageView.layer.shadowRadius = 2.0
        return imageView
    }()

    private let nameStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 0
        return stack
    }()

    private func downloadImage(_ imageURL: String) {
        guard let thumbnailURL = URL(string: imageURL) else { return }
        let resource = ImageResource(downloadURL: thumbnailURL, cacheKey: imageURL)
        thumbnail.kf.indicatorType = .activity
        thumbnail.kf.setImage(with: resource)
    }

    func makeLeftPlayerDisplay(player: Player){
        nickname = player.nickname
        name = "\(player.firstName ?? "") \(player.lastName ?? "")"
        playerImage = player.imageURL ?? ""
        setupMainLayout()
        setupLayoutLeft()
    }

    func makeRightPlayerDisplay(player: Player){
        nickname = player.nickname
        name = "\(player.firstName ?? "") \(player.lastName ?? "")"
        playerImage = player.imageURL ?? ""
        setupMainLayout()
        setupLayoutRight()
    }

    private func setupMainLayout() {
        addSubview(nameStackView)
        nameStackView.addArrangedSubview(playerNickname)
        nameStackView.addArrangedSubview(playerFullName)
        addSubview(thumbnail)

        // playerCard
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 190),
            heightAnchor.constraint(equalToConstant: 54)
        ])

        // thumbnail
        NSLayoutConstraint.activate([
            thumbnail.topAnchor.constraint(equalTo: topAnchor, constant: -4),
            thumbnail.widthAnchor.constraint(equalToConstant: 48),
            thumbnail.heightAnchor.constraint(equalToConstant: 48)
        ])

        // nameStackView
        NSLayoutConstraint.activate([
            nameStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func setupLayoutLeft() {
        nameStackView.alignment = .trailing

        // thumbnail
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalToSystemSpacingAfter: thumbnail.trailingAnchor, multiplier: 1.5)
        ])

        // nameStackView
        NSLayoutConstraint.activate([
            thumbnail.trailingAnchor.constraint(equalToSystemSpacingAfter: nameStackView.trailingAnchor, multiplier: 8)
        ])
    }

    private func setupLayoutRight() {
        nameStackView.alignment = .leading

        // thumbnail
        NSLayoutConstraint.activate([
            thumbnail.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.5),
        ])

        // nameStackView
        NSLayoutConstraint.activate([
            nameStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: thumbnail.trailingAnchor, multiplier: 1)
        ])
    }
}
