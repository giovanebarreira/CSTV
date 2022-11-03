//
//  TeamDetailsCoordinatorTests.swift
//  CSTVTests
//
//  Created by Giovane Barreira on 03/11/22.
//

import XCTest
import UIKit
@testable import CSTV

final class TeamDetailsCoordinatorTests: XCTestCase {

  var sut: TeamDetailsCoordinator!
  var navigationController: UINavigationController!

  override func setUp() {
    super.setUp()
    navigationController = UINavigationController()
      sut = TeamDetailsCoordinator(navigationController: navigationController, selectedMatch: MatchesListDisplayDummy.display)
  }

  override func tearDown() {
    navigationController = nil
    sut = nil
    super.tearDown()
  }

  func test_if_startOpens_teamDetailsScreen() {
    sut.start()

    XCTAssert(navigationController.viewControllers.first is TeamDetailsViewController)
  }
}
