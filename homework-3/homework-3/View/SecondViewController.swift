//
//  SecondViewController.swift
//  homework-3
//
//  Created by Денис Гынгазов on 30.10.2020.
//

import UIKit

class SecondViewController: UIViewController {

// MARK: - Property

// MARK: - Lyfe Cycle

	override func viewDidLoad() {
		super.viewDidLoad()

		setupViewApperance()
		setupViewLayout()
	}
}

// MARK: - Apperance

private extension SecondViewController {

	func setupViewApperance() {
		setupTabBarItemApperance()
	}

	func setupTabBarItemApperance() {
		var tabBarItem = UITabBarItem()
		view.backgroundColor = .systemBlue
		self.navigationItem.title = "Второй экран"
		tabBarItem = UITabBarItem(title: "Второй экран", image: .checkmark, tag: 1)
		self.tabBarItem = tabBarItem
	}
}

// MARK: - Layout

private extension SecondViewController {
	
	func setupViewLayout() {
		
	}
}
