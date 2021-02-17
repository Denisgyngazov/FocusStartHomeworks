//
//  DetailViewController.swift
//  homework-6-builder
//
//  Created by Денис Гынгазов on 20.11.2020.
//

import UIKit

final class DetailViewController: UIViewController {

// MARK: - Property

	private let interactor: Interactor

// MARK: - Init

	init(title: String, interactor: Interactor) {
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
		self.title = title
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

// MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBlue
	}
}
