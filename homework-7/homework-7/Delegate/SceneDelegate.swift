//
//  SceneDelegate.swift
//  homework-7
//
//  Created by Денис Гынгазов on 02.12.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		window = UIWindow(windowScene: windowScene)
		window?.rootViewController = ImageLoaderViewController()
		window?.makeKeyAndVisible()
	}
}

