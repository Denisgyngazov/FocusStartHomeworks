//
//  ThirdViewController.swift
//  homework-3
//
//  Created by Денис Гынгазов on 30.10.2020.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		view.backgroundColor = .systemBlue
		self.navigationItem.title = "Третий экран"
		var tabBarItem = UITabBarItem()

		tabBarItem = UITabBarItem(title: "Третий экран", image: .checkmark, tag: 2)
		self.tabBarItem = tabBarItem

    }

}
