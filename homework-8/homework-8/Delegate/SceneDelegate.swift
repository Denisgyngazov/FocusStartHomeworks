//
//  SceneDelegate.swift
//  homework-8
//
//  Created by Денис Гынгазов on 07.12.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		guard let windowScene = (scene as? UIWindowScene) else { return }

		window = UIWindow(windowScene: windowScene)
		let companyViewController = CompanyViewController()
		let navigationContoller = UINavigationController(rootViewController: companyViewController )
		window?.rootViewController = navigationContoller
		window?.makeKeyAndVisible()
	}
}

