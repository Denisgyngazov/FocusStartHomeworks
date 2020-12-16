//
//  SceneDelegate.swift
//  homework-6-builder
//
//  Created by Денис Гынгазов on 20.11.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let winScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(windowScene: winScene)

		let firstViewController = FirstViewController()

		window?.rootViewController = firstViewController
		window?.makeKeyAndVisible()
	}
}

