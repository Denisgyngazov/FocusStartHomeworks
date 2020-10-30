//
//  ViewController.swift
//  homework-3
//
//  Created by Денис Гынгазов on 30.10.2020.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .systemBlue
		self.navigationItem.title = "Первый экран"
		var tabBarItem = UITabBarItem()
		
		tabBarItem = UITabBarItem(title: "Первый экран", image: .checkmark, tag: 0)
		self.tabBarItem = tabBarItem


	}
}

