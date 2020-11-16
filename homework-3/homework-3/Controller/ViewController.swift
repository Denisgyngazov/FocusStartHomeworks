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
	}
}



