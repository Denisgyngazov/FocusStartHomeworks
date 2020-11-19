//
//  AppDelegate.swift
//  homework-6-observer
//
//  Created by Денис Гынгазов on 19.11.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		 true
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

		UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}
}

