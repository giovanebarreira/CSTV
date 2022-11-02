//
//  AppDelegate.swift
//  CSTV
//
//  Created by Giovane Barreira on 30/10/22.
//

import UIKit
import Kingfisher

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        KingfisherManager.shared.defaultOptions = [.requestModifier(TokenPlugin(token:"19bZLlNADA802Bihew3yz4rhdksLZRYEc61YH3hIAbtAdku_FHU"))]
        return true
    }
}

