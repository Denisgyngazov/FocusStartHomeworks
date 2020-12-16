//
//  FirstViewController.swift
//  homework-6-observer
//
//  Created by Денис Гынгазов on 18.11.2020.
//

import UIKit

class FirstViewController: UIViewController {

	private let firstView = FirstView()

	override func loadView() {
		self.view = firstView
	}
}
