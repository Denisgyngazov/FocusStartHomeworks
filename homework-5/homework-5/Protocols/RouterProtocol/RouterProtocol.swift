//
//  RouterProtocol.swift
//  homework-5
//
//  Created by Денис Гынгазов on 16.11.2020.
//

import UIKit

protocol RouterMain {
	 var navigationController: UINavigationController? { get set}
	 var assembly: Assembly? { get set }
}

protocol RouterProtocol: RouterMain {
	func initialViewController()
	func showDetail(comment: Comments?)
	func popToRoot()
}
