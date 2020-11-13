//
//  Networks.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import Foundation

final class Networks: NetworksProtocol {
	func getComments(completion: @escaping (Result<[Comments]?, Error>) -> ()) {
		let urlString = "https://jsonplaceholder.typicode.com/comments"
		guard let url = URL(string: urlString) else { return }

		URLSession.shared.dataTask(with: url) { data, _, error in
			if let error = error {
				completion(.failure(error))
				return
			}

			do {
				let object = try JSONDecoder().decode([Comments].self, from: data!)
				completion(.success(object))
			} catch {
				completion(.failure(error))
			}
		} .resume()
	}
}
