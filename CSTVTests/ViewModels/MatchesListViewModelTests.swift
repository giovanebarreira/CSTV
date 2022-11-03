//
//  MatchesListViewModelTests.swift
//  CSTVTests
//
//  Created by Giovane Barreira on 03/11/22.
//

import XCTest
@testable import CSTV

final class MatchesListViewModelTests: XCTestCase {

    var sut: MatchesListViewModel!
    var matchesListservice: MatchesListServiceMock!

    override func setUpWithError() throws {
        try super.setUpWithError()
        matchesListservice = MatchesListServiceMock()
        sut = MatchesListViewModel(matchesListService: matchesListservice)
    }

    override func tearDownWithError() throws {
        matchesListservice = nil
        sut = nil
        try super.tearDownWithError()
    }

    func test_fetchMatchesList_returnSuccess() {
        sut.fetchMatchesList(page: 1) { matches in
            XCTAssertNotEqual(matches!.count, 0)
            XCTAssertEqual(matches!.first, MatchDummy.match)
        }
    }

    func test_fetchMatchesList_returnFailure() {
        matchesListservice.isFetchingError = true

        sut.fetchMatchesList(page: 1) { matches in
            XCTAssertEqual(matches, nil)
        }
    }
}

