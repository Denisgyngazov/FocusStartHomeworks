//
//  ThirdViewController.swift
//  homework-3
//
//  Created by Денис Гынгазов on 30.10.2020.
//

import UIKit

class ThirdViewController: UIViewController {
	
// MARK: - Property

// MARK: - Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()

		setupViewApperance()
		setupViewLayout()
	}
}

// MARK: - Apperance

private extension ThirdViewController {

	func setupViewApperance() {
		setupTabBarItemApperance()
	}

	func setupTabBarItemApperance() {
		var tabBarItem = UITabBarItem()
		view.backgroundColor = .systemBlue
		self.navigationItem.title = "Третий экран"
		tabBarItem = UITabBarItem(title: "Третий экран", image: .checkmark, tag: 2)
		self.tabBarItem = tabBarItem
	}
}

// MARK: - Layout

private extension ThirdViewController {
	
	func setupViewLayout() {

	}
}
