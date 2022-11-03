//
//  MatchesListCoordinatorTests.swift
//  CSTVTests
//
//  Created by Giovane Barreira on 03/11/22.
//

import XCTest
import UIKit
@testable import CSTV

final class MatchesListCoordinatorTests: XCTestCase {

  var sut: MatchesListCoordinator!
  var navigationController: UINavigationController!

  override func setUp() {
    super.setUp()
    navigationController = UINavigationController()
    sut = MatchesListCoordinator(navigationController: navigationController)
  }

  override func tearDown() {
    navigationController = nil
    sut = nil
    super.tearDown()
  }

  func test_if_startOpens_matcheListScreen() {
    sut.start()

    XCTAssert(navigationController.viewControllers.first is MatchesListViewController)
  }

  func test_if_goToMatchDetails_opensTheRightScreen() {
      sut.goToMatchDetails(selectedMatch: MatchesListDisplayDummy.display)

    XCTAssert(navigationController.viewControllers.first is TeamDetailsViewController)
  }
}

