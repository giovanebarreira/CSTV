//
//  TeamDetails+Dummy.swift
//  CSTVTests
//
//  Created by Giovane Barreira on 03/11/22.
//

@testable import CSTV

enum TeamDetailsDummy {
    static let details = TeamDetailsDisplay(
        selectedMatch: MatchesListDisplayDummy.display,
        team1: Team1DetailsDummy.details.players,
        team2: Team2DetailsDummy.details.players
    )
}
