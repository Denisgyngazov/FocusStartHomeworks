//
//  ViewController.swift
//  homework-7
//
//  Created by Денис Гынгазов on 02.12.2020.
//

import UIKit
import Alamofire

class ImageLoaderViewController: UIViewController {

	private let imageLoaderView = ImageLoaderView()

	override func loadView() {
		super.loadView()
		self.view = imageLoaderView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
}


