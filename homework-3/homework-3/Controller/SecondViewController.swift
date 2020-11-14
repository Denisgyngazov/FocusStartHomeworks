//
//  SecondViewController.swift
//  homework-3
//
//  Created by Денис Гынгазов on 30.10.2020.
//

import UIKit

final class SecondViewController: UIViewController {

// MARK: - View
	
	private let secondView = SecondView()

// MARK: - Life Cycle

	override func loadView() {
		self.view = secondView
		setupTabBarItemApperance()
	}
}

// MARK: - Apperance

private extension SecondViewController {

	func setupTabBarItemApperance() {
		var tabBarItem = UITabBarItem()
		view.backgroundColor = .systemBlue
		self.navigationItem.title = NavigationItems.secondScreen.rawValue
		tabBarItem = UITabBarItem(title: TabBarItems.secondScreen.rawValue, image: .checkmark, tag: 1)
		self.tabBarItem = tabBarItem
	}
}

