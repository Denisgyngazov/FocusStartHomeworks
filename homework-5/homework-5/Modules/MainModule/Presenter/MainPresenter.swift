//
//  MainPresenter.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import Foundation

final class MainPresenter: MainViewPresenterProtocol {

// MARK: - Property

	weak var view: MainViewProtocol?
	var router: RouterProtocol?
	var networks: NetworksProtocol
	var comments: [Comments]?

// MARK: - Init

	init(view: MainViewProtocol, networks: NetworksProtocol, router: RouterProtocol) {
		self.view = view
		self.networks = networks
		self.router = router
		getComments()
	}

	func tapOnTheComment(comment: Comments?) {
		router?.showDetail(comment: comment)
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

