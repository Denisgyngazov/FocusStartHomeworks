//
//  SceneDelegate.swift
//  homework-3
//
//  Created by Денис Гынгазов on 30.10.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	var window: UIWindow?
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let winScene = (scene as? UIWindowScene) else { return }
		let firstVC = ViewController()
		let secondVC = SecondViewController()
		let thirdVC = ThirdViewController()
		let tabBarVC = UITabBarController()
		let firstNavController = UINavigationController(rootViewController: firstVC)
		let secondNavController = UINavigationController(rootViewController: secondVC)
		let thirdNavController = UINavigationController(rootViewController: thirdVC)
		
		tabBarVC.setViewControllers([firstNavController,
									 secondNavController,
									 thirdNavController],
									animated: true)
		
		window = UIWindow(windowScene: winScene)
		window?.rootViewController = tabBarVC
		window?.makeKeyAndVisible()
	}
}

