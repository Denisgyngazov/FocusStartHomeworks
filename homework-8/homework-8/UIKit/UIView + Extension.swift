//
//  UIView + Extension.swift
//  homework-8
//
//  Created by Денис Гынгазов on 08.12.2020.
//

import UIKit

extension UIView {
	func findViewController() -> UIViewController? {
		if let nextResponder = self.next as?
			UIViewController {
			return nextResponder
		}
		else if let nextResponder = self.next as? UIView {
			return nextResponder.findViewController()
		}
		else {
			return nil
		}
	}
}
