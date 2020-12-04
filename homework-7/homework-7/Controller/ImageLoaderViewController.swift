//
//  ViewController.swift
//  homework-7
//
//  Created by Денис Гынгазов on 02.12.2020.
//

import UIKit

protocol ImageViewAllertControllerDelegate: AnyObject {
	func showErrorLoadImage(title: String, body: String)
}

final class ImageLoaderViewController: UIViewController {
	
	//MARK: - Property

	private let imageLoaderView = ImageLoaderView()

	//MARK: - Life Cycle

	override func loadView() {
		super.loadView()
		self.view = imageLoaderView
	}
}

	//MARK: - AllertController

extension ImageLoaderViewController: ImageViewAllertControllerDelegate {
	func showErrorLoadImage(title: String, body: String) {
		let alertController = UIAlertController(title: title, message: body, preferredStyle: .alert)
		let action = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
		}

		alertController.addAction(action)
		self.present(alertController, animated: true, completion: nil)
	}
}


