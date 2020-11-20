//
//  FirstViewController.swift
//  homework-6-builder
//
//  Created by Денис Гынгазов on 20.11.2020.
//

import UIKit

class FirstViewController: UIViewController {

// MARK: - View

	private let firstView = FirstView()

// MARK: - Life Cycle

	override func loadView() {
		self.view = firstView
		firstView.firstButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
	}
}

// MARK: - Button Clicked

private extension FirstViewController {
	@objc func buttonClicked() {
		let controller = DetailBuilder().setTitle("Detail").build()
		self.present(controller, animated: true, completion: nil)
	}
}

