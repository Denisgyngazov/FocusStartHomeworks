//
//  MainPresenter.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
	func getComments()
	var comments: [Comments]? { get set }
}

final class MainPresenter: MainViewPresenterProtocol {

// MARK: - Property

	private weak var view: MainViewProtocol?
	private var networks: NetworksProtocol
	var comments: [Comments]?

// MARK: - Init

	init(view: MainViewProtocol, networks: NetworksProtocol) {
		self.view = view
		self.networks = networks
		getComments()
	}

// MARK: - Get comments
	
	func getComments() {
		networks.getComments { [weak self] result in
			guard let self = self else { return }

			DispatchQueue.main.async {
				switch result {
				case .success(let comments):
					self.comments = comments
					self.view?.succes()
				case .failure(let error):
					self.view?.failure(error: error)
				}
			}
		}
	}
}

