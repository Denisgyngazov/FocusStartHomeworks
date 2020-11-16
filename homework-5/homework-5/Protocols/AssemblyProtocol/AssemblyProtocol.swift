//
//  BuilderProtocol.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import UIKit

protocol Assembly {
	func createMainModule(router: RouterProtocol) -> UIViewController
	func createDetailModule(comment: Comments?, router: RouterProtocol) -> UIViewController
}
