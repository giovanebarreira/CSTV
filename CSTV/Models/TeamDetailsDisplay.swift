//
//  TeamDetailsDisplay.swift
//  CSTV
//
//  Created by Giovane Barreira on 02/11/22.
//

import Foundation

struct TeamDetailsDisplay: Equatable {
    static func == (lhs: TeamDetailsDisplay, rhs: TeamDetailsDisplay) -> Bool {
        lhs.selectedMatch.matchTime == rhs.selectedMatch.matchTime
    }

    let selectedMatch: MatchesListDisplay
    let team1: [Player]?
    let team2: [Player]?
}
