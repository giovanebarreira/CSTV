//
//  TeamDetailsViewModelTests.swift
//  CSTVTests
//
//  Created by Giovane Barreira on 03/11/22.
//

import XCTest
@testable import CSTV

final class TeamDetailsViewModelTests: XCTestCase {

    var sut: TeamDetailsViewModel!
    var teamDetailsService: TeamDetailsServiceMock!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let selectedMatch = MatchesListDisplayDummy.display
        teamDetailsService = TeamDetailsServiceMock()
        sut = TeamDetailsViewModel(service: teamDetailsService, selectedMatch: selectedMatch)
    }

    override func tearDownWithError() throws {
        teamDetailsService = nil
        sut = nil
        try super.tearDownWithError()
    }

    func test_fetchTeam1Details_returnSuccess() {
        let group = DispatchGroup()
        
        sut.fetchTeam1Details(slug: "cs-go", group: group) { details in
            XCTAssertNotEqual(details!.count, 0)
            XCTAssertEqual(details!.first, Team1DetailsDummy.details)
        }
    }

    func test_fetchTeam1Details_returnFailure() {
        let group = DispatchGroup()
        teamDetailsService.isFetchingError = true

        sut.fetchTeam1Details(slug: "cs-go", group: group) { details in
            XCTAssertEqual(details, nil)
        }
    }

    func test_fetchTeam2Details_returnSuccess() {
        let group = DispatchGroup()
        teamDetailsService.pathType = .team2

        sut.fetchTeam2Details(slug: "enterprise-esports", group: group) { details in
            XCTAssertNotEqual(details!.count, 0)
            XCTAssertEqual(details!.first, Team2DetailsDummy.details)
        }
    }

    func test_fetchTeam2Details_returnFailure() {
        let group = DispatchGroup()
        teamDetailsService.isFetchingError = true

        sut.fetchTeam2Details(slug: "enterprise-esports", group: group) { details in
            XCTAssertEqual(details, nil)
        }
    }

}
