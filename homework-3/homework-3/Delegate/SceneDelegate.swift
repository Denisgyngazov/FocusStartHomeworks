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
		window = UIWindow(windowScene: winScene)

		let tabBarVC = UITabBarController()

		let firstVC = ViewController()
		let firsControllerBarItem = UITabBarItem(title: TabBarItems.firstScreen.rawValue, image: .checkmark, tag: 0)

		firstVC.tabBarItem = firsControllerBarItem

		let secondVC = SecondViewController()
		let secondControllerBarItem = UITabBarItem(title: TabBarItems.secondScreen.rawValue, image: .checkmark, tag: 1)
		secondVC.tabBarItem = secondControllerBarItem

		let thirdVC = ThirdViewController()
		let thirdControllerBarItem = UITabBarItem(title: TabBarItems.thirdScreen.rawValue, image: .checkmark, tag: 2)
		thirdVC.tabBarItem = thirdControllerBarItem

		tabBarVC.setViewControllers([firstVC,secondVC,thirdVC], animated: true)

		window?.rootViewController = tabBarVC
		window?.makeKeyAndVisible()
	}
}




