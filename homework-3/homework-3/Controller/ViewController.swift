//
//  ViewController.swift
//  homework-3
//
//  Created by Денис Гынгазов on 30.10.2020.
//

import UIKit

final class ViewController: UIViewController {

// MARK: - View

	private let firstView = FirstView()
	
// MARK: - Life Сycle

	override func loadView() {
		self.view = firstView
		setupTabBarItemApperance()
	}
}

private extension ViewController {
	func setupTabBarItemApperance() {
		var tabBarItem = UITabBarItem()
		view.backgroundColor = .systemBlue
		self.navigationItem.title = NavigationItems.firstScreen.rawValue
		tabBarItem = UITabBarItem(title: TabBarItems.firstScreen.rawValue, image: .checkmark, tag: 0)
		self.tabBarItem = tabBarItem
	}
}

