//
//  ThirdViewController.swift
//  homework-3
//
//  Created by Денис Гынгазов on 30.10.2020.
//

import UIKit

final class ThirdViewController: UIViewController {

// MARK: - View

	private let thirdView = ThirdView()

// MARK: - Life Cycle

	override func loadView() {
		self.view = thirdView
		setupTabBarItemApperance()
	}
}

// MARK: - Apperance

private extension ThirdViewController {
	func setupTabBarItemApperance() {
		var tabBarItem = UITabBarItem()
		view.backgroundColor = .systemBlue
		self.navigationItem.title = NavigationItems.thirdScreen.rawValue
		tabBarItem = UITabBarItem(title: TabBarItems.thirdScreen.rawValue,
								  image: .checkmark, tag: 2)
		self.tabBarItem = tabBarItem
	}
}

