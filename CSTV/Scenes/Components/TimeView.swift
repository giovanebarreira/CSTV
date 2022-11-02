//
//  TimeView.swift
//  CSTV
//
//  Created by Giovane Barreira on 01/11/22.
//

import UIKit

class TimeView: UIStackView {
    var timeString: String
    var isNow: Bool

    private var timeLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 8)
        label.text = isNow ? "AGORA" : timeString
        label.textColor = .title
        return label
    }

    init(timeString: String, isNow: Bool) {
        self.timeString = timeString
        self.isNow = isNow
        super.init(frame: .zero)
        self.backgroundColor = isNow ? .alert : .scheduleTime
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
