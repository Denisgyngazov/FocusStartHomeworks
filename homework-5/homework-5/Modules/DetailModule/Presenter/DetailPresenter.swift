//
//  DetailPresenter.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import Foundation

final class DetailPresenter: DetailViewPresenterProtocol {

// MARK: - Property

	weak var view: DetailViewProtocol?
	var router: RouterProtocol?
	var networks: NetworksProtocol
	var comment: Comments?

// MARK: - Init
	
	init(view: DetailViewProtocol, networks: NetworksProtocol, router: RouterProtocol, comment: Comments?) {
		self.view = view
		self.comment = comment
		self.networks = networks
		self.router = router
	}


// MARK: - Set comment

	public func viewComment() {
		self.view?.setComment(comment: comment)
	}
}
