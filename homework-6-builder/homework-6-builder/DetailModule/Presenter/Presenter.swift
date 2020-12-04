//
//  MainPresenter.swift
//  homework-6-builder
//
//  Created by Денис Гынгазов on 20.11.2020.
//

import Foundation

protocol Presenter {
	var messageInfo: String { get }
}

final class MainPresenter: Presenter {
	weak var viewController: DetailViewController?
	var messageInfo: String = ""
}
