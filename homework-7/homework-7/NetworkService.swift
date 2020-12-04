//
//  NetworkService.swift
//  homework-7
//
//  Created by Денис Гынгазов on 04.12.2020.
//

import Alamofire
import AlamofireImage

protocol delegateUpdate: AnyObject {
	func update(image: [URL])
}

protocol loadImage {
	func loadImage(imageView: UIImageView)
}


final class NetworkService: loadImage {

	// MARK: - Property

	private var ulr: URL?
	private let imageCell = ImageLoaderCell()
	weak var delegeteAllertController: ImageViewAllertControllerDelegate?

	func loadImage(imageView: UIImageView) {
		guard let url = ulr else {return}
		AF.request(url.absoluteString).responseImage { response in
			if case .success(let image) = response.result {
				imageView.image = image
			}
			
			if case .failure( _) = response.result {
				self.delegeteAllertController?.showErrorLoadImage(title: "Ошибка загрузки", body: "Изображение не было загружено")
			}
		}
	}
}
