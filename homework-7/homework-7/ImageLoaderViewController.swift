//
//  ViewController.swift
//  homework-7
//
//  Created by Денис Гынгазов on 02.12.2020.
//

import UIKit

class ImageLoaderViewController: UIViewController {

	private let imageLoaderView = ImageLoaderView()

	private var image = [URL]()

	override func loadView() {
		super.loadView()
		self.view = imageLoaderView
	}
}

extension ImageLoaderViewController: UITableViewDelegate {

}

