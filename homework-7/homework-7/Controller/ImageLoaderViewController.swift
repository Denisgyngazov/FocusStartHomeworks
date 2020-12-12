//
//  ViewController.swift
//  homework-7
//
//  Created by Денис Гынгазов on 02.12.2020.
//

import UIKit

final class ImageLoaderViewController: UIViewController {

	//MARK: - Property

	private let imageLoaderView = ImageLoaderView()

	//MARK: - Life Cycle

	override func loadView() {
		super.loadView()
		self.view = imageLoaderView
	}
}





