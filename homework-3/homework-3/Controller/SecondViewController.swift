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
	}
}



