//
//  SecondViewController.swift
//  homework-3
//
//  Created by Денис Гынгазов on 30.10.2020.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		view.backgroundColor = .systemBlue
		self.navigationItem.title = "Второй экран"
		var tabBarItem = UITabBarItem()

		tabBarItem = UITabBarItem(title: "Второй экран", image: .checkmark, tag: 1)
		self.tabBarItem = tabBarItem
    }
}
