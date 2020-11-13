//
//  DetailViewController.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import UIKit

final class DetailViewController: UIViewController {

// MARK: - View

	@IBOutlet weak var commentLabel: UILabel!
	var presenter: DetailViewPresenterProtocol!

// MARK: - Life Cycle

	override func viewDidLoad() {
        super.viewDidLoad()
		presenter.setComment()
    }
}

// MARK: - Set comment

extension DetailViewController: DetailViewProtocol {
	func setComment(comment: Comments?) {
		commentLabel.text = comment?.body
	}
}
