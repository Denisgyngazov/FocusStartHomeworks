//
//  BuilderProtocol.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import UIKit

protocol Builder {
	static func createMainModule() -> UIViewController
	static func createDetailModule(comment: Comments?) -> UIViewController
}
