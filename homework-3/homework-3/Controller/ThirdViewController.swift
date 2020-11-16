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
	}
}



