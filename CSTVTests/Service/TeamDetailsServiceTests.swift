//
//  TeamDetailsServiceTests.swift
//  CSTVTests
//
//  Created by Giovane Barreira on 03/11/22.
//

import XCTest
@testable import CSTV

final class TeamDetailsServiceTests: XCTestCase {

    var sut: TeamDetailsService!
    var networkService: NetworkServiceMock!

    override func setUpWithError() throws {
        try super.setUpWithError()
        networkService = NetworkServiceMock()
        sut = TeamDetailsService(service: networkService)
    }

    override func tearDownWithError() throws {
        networkService = nil
        sut = nil
        try super.tearDownWithError()
    }

    func test_fetchDetails_returnSuccess() {
        let expectation = expectation(description: "feching teamDetails")
        networkService.pathType = .team1

        sut.fetchTeamDetails(teamSlug: "cs-go") { result in
            switch result {
            case .success(let teamDetails):
                XCTAssertEqual(teamDetails.first, Team1DetailsDummy.details)
            case .failure:
                XCTFail("Should return success")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    func test_fetchDetails_returnFailure() {
        let expectation = expectation(description: "feching teamDetails")
        networkService.isFetchingError = true
        
        sut.fetchTeamDetails(teamSlug: "cs-go") { result in
            switch result {
            case .success:
                XCTFail("Should return failure")
            case .failure(let error):
                XCTAssertEqual(error, NetworkError.badResponse)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
}
