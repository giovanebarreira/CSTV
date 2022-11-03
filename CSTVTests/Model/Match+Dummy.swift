//
//  Match+Dummy.swift
//  CSTVTests
//
//  Created by Giovane Barreira on 03/11/22.
//

@testable import CSTV

enum MatchDummy {
    static let match = Match(
        beginAt: "2022-11-03T13:00:00Z",
        league: League(
            id: 4243,
            imageURL: "https://play.esea.net/",
            name: "ESEA"
        ),
        competitors: [
            Competitors(opponent: Opponent(
                id: 128550,
                imageURL: "https://cdn.pandascore.co/images/team/image/128550/108px_club_brugge_e_sports.png",
                name: "EC Brugge",
                slug: "club-brugge-esports"
               )
            ),
            Competitors(opponent: Opponent(
                id: 126699,
                imageURL: "https://cdn.pandascore.co/images/team/image/126699/7187.png",
                name: "Nexus",
                slug: "nexus"
               )
            )
        ],
        serie: Serie(fullName: "Advanced Europe season 43 2022")
    )
}
