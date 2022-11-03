//
//  TimeView.swift
//  CSTV
//
//  Created by Giovane Barreira on 01/11/22.
//

import UIKit

final class TimeView: UIStackView {
    var timeString: String = "" {
        didSet {
            timeLabel.text = timeString
        }
    }

    var isNow: Bool = false {
        didSet {
            self.backgroundColor = isNow ? .alert : .scheduleTime
            timeLabel.text = isNow ? "AGORA" : timeString
        }
    }

    var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 8)
        label.textColor = .title
        return label
    }()

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .center
        addArrangedSubview(timeLabel)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCorners(corners: [.bottomLeft, .topRight], radius: 16)
    }
}
