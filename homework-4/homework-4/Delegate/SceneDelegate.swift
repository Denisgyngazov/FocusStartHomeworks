//
//  SceneDelegate.swift
//  homework-4
//
//  Created by Денис Гынгазов on 06.11.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UISplitViewControllerDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let winScene = (scene as? UIWindowScene) else { return }
		self.window = UIWindow(windowScene: winScene)

		let masterController = MasterViewController()
		let navigationMasterController = UINavigationController(rootViewController: masterController)

		let detailController = DetailViewController()
		let navigationDetailController = UINavigationController(rootViewController: detailController)

		let splitViewController = UISplitViewController()
		splitViewController.viewControllers = [navigationMasterController, navigationDetailController]
		splitViewController.preferredDisplayMode = .oneBesideSecondary
		splitViewController.delegate = self

		splitViewController.preferredPrimaryColumnWidthFraction = 0.5
		splitViewController.maximumPrimaryColumnWidth = 2000

		window?.rootViewController = splitViewController
		window?.makeKeyAndVisible()

	}

	func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
		return true
	}
}

