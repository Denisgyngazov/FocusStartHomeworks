//
//  DetailPresenter.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import Foundation

class DetailPresenter: DetailViewPresenterProtocol {

// MARK: - Property

	weak var view: DetailViewProtocol?
	var networks: NetworksProtocol
	var comment: Comments?

// MARK: - Init

	required init(view: DetailViewProtocol, networks: Networks, comment: Comments?) {
		self.view = view
		self.comment = comment
		self.networks = networks
	}

// MARK: - Set comment

	public func setComment() {
		self.view?.setComment(comment: comment)
	}
}
