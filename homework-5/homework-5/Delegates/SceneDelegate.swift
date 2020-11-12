//
//  SceneDelegate.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }

		window = UIWindow(frame: windowScene.coordinateSpace.bounds)
		window?.windowScene = windowScene
		let mainViewController = ModuleBuilder.createMainModule()
		let navigationController = UINavigationController(rootViewController: mainViewController)
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()

	}
}

