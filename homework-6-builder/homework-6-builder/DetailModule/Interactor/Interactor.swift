//
//  MainInteractor.swift
//  homework-6-builder
//
//  Created by Денис Гынгазов on 20.11.2020.
//

import Foundation

protocol Interactor {
	init(presenter: Presenter)
}

final class MainInteractor: Interactor {
	private var presenter: Presenter

	init(presenter: Presenter) {
		self.presenter = presenter
	}
}
