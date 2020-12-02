//
//  ImagLoaderDataSource.swift
//  homework-7
//
//  Created by Денис Гынгазов on 02.12.2020.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {

	private var image = [URL]()


	init(withData image: [URL]) {
		self.image = image
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.image.count
		
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageLoaderCell.identifaer, for: indexPath) as? ImageLoaderCell
		else { return UITableViewCell() }
		cell.configure(url: image[indexPath.row])

		return cell
	}
}
