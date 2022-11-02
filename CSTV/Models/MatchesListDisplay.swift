//
//  MatchesListDisplay.swift
//  CSTV
//
//  Created by Giovane Barreira on 02/11/22.
//

import Foundation

struct MatchesListDisplay {
    private let match: Match

    init(match: Match) {
        self.match = match
    }

    var matchTime: String {
        let time = match.beginAt

        if time.isNow {
            return "AGORA"
        } else if time.isToday {
            return "Hoje, \(time.hour)"
        } else if time.isTomorrow {
            return time.weekDayHour
        } else {
            return time.dayMonthHour
        }
    }

    var matchTimeIsNow: Bool { match.beginAt.isNow }
    var team1Bagde: String { match.competitors.first?.opponent.imageURL ?? "" }
    var team1Name: String { match.competitors.first?.opponent.name ?? "" }
    var team2Bagde: String { match.competitors.last?.opponent.imageURL ?? "" }
    var team2Name: String { match.competitors.last?.opponent.name ?? "" }
    var leagueBadge: String { match.league.imageURL ?? "" }

    var leagueAndSerie: String {
        let leagueName = match.league.name
        let serie = match.serie.fullName
        return "\(leagueName) \(serie)"
    }

    var competitors: [Competitors] { match.competitors }
}




