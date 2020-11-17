//
//  DetailPresenter.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import Foundation

protocol DetailViewPresenterProtocol: AnyObject {
	func viewComment()
}

final class DetailPresenter: DetailViewPresenterProtocol {

// MARK: - Property

	private weak var view: DetailViewProtocol?
	private var networks: NetworksProtocol
	private var comment: Comments?

// MARK: - Init
	
	init(view: DetailViewProtocol, networks: NetworksProtocol, comment: Comments?) {
		self.view = view
		self.comment = comment
		self.networks = networks
	}

// MARK: - Set comment

	public func viewComment() {
		self.view?.setComment(comment: comment)
	}
}
