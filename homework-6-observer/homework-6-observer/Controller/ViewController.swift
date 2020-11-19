//
//  ViewController.swift
//  homework-6-observer
//
//  Created by Денис Гынгазов on 19.11.2020.
//

import UIKit

class ViewController: UIViewController {
// MARK: - View Outlet

	@IBOutlet weak var firstLabel: UILabel!

// MARK: - Property

	let notificationCenter = NotificationCenters()
	let firstObserver = FirstObserver()

// MARK: - Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
// MARK: - View action

	@IBAction func updateButton(_ sender: UIButton) {
		notificationCenter.businessLogic()
	}

	@IBAction func subscribeSwitch(_ sender: UISwitch) {
		if sender.isOn {
			notificationCenter.subscribe(self)
			notificationCenter.subscribe(firstObserver)
		} else {
			notificationCenter.unsubscribe(self)
			notificationCenter.unsubscribe(firstObserver)
		}
	}
}

// MARK: - Extenshion
extension ViewController: Observer {
	func update(subject: NotificationCenters) {
		firstLabel.text = "State subject: \(subject.state)"
	}
}

