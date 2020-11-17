//
//  ModuleBilder.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import UIKit

protocol AssemblyMainModuleProtocol {
	static func createMainModule() -> UIViewController
}

final class AssemblyMainBuilder: AssemblyMainModuleProtocol {
	static func createMainModule() -> UIViewController {
		let view = MainViewController()
		let networks = Networks()
		let presenter = MainPresenter(view: view, networks: networks)
		view.presenter = presenter
		return view
	}
}



