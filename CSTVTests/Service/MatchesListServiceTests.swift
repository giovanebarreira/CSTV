//
//  MatchesListServiceTests.swift
//  CSTVTests
//
//  Created by Giovane Barreira on 03/11/22.
//

import XCTest
@testable import CSTV

final class MatchesListServiceTests: XCTestCase {

    var sut: MatchesListService!
    var networkService: NetworkServiceMock!

    override func setUpWithError() throws {
        try super.setUpWithError()
        networkService = NetworkServiceMock()
        sut = MatchesListService(service: networkService)
    }

    override func tearDownWithError() throws {
        networkService = nil
        sut = nil
        try super.tearDownWithError()
    }

    func test_fetchMatches_returnSuccess() {
        let expectation = expectation(description: "feching list")

        sut.fetchMatches(page: 1) { result in
            switch result {
            case .success(let matchList):
                XCTAssertEqual(matchList.first, MatchDummy.match)
            case .failure:
              XCTFail("Should return success")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    func test_fetchMatches_returnFailure() {
        let expectation = expectation(description: "feching list")
        networkService.isFetchingError = true

        sut.fetchMatches(page: 1) { result in
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
