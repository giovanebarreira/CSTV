//
//  Coordinator.swift
//  CSTV
//
//  Created by Giovane Barreira on 30/10/22.
//

import UIKit

protocol Coordinator {
  var navigationController: UINavigationController { get set }
  func start()
}
