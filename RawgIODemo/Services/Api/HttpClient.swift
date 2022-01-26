//
//  HttpClient.swift
//  RagwIODemo
//
//  Created by Gokhan Mutlu on 23.01.2022.
//

import Foundation

final class HttpClient<S:Session>{
	
	//injecting session
	init(session:S){
		self.session = session
	}
	
	func searchFor(url:URL, completion:@escaping (Result<Data, RawgApiError>)->()){
		
		let task = session.dataTask(with: url) { data, response, error in
			guard let dataValid = data, error == nil else {
				return completion(.failure(.anyError(error!)))
			}
			
			if let urlResponse = response as? HTTPURLResponse, urlResponse.statusCode != 200{
				return completion(.failure(.statusCodeNot200(urlResponse.url?.absoluteString ?? "Error! please check your query")))
			}
			
			completion(.success(dataValid))
		}
		
		task.resume()
	}
	
	
	//MARK: - Properties
	
	private let session: S
	
}
