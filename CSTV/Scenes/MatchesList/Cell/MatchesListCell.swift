//
//  MatchesListCell.swift
//  CSTV
//
//  Created by Giovane Barreira on 31/10/22.
//

import UIKit

final class MatchesListCell: UITableViewCell {
    static let reuseId = "MatchesListCell"
    static let estimatedRowHeight: CGFloat = 176


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
