//
//  UIViewController+Alert.swift
//  CSTV
//
//  Created by Giovane Barreira on 31/10/22.
//

import UIKit

extension UIViewController {
  func showAlert(errorMessage: String, callback: @escaping() -> Void) {
    let alert = UIAlertController(title: "Error", message: "\(errorMessage)", preferredStyle: .alert)

    alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { _ in
      callback()
    }))

    alert.addAction(UIAlertAction(title: "Cancel", style: .default) { [weak self] _ in
      self?.dismiss(animated: true)
    })
    present(alert, animated: true)
  }
}
