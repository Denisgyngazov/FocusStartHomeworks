//
//  ViewController.swift
//  homework-4
//
//  Created by Денис Гынгазов on 06.11.2020.
//

import UIKit

final class DetailViewController: UIViewController {

// MARK: - Property

	private var desctiptionText: String

// MARK: - Life Сycle
	
	override func loadView() {
		self.view = DetailView(descriptionText: desctiptionText, frame: .zero)
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}

	init(descriptionText: String = "") {
		self.desctiptionText = descriptionText
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}







