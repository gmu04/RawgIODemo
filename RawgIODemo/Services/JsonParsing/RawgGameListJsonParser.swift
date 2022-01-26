//
//  RawgParser.swift
//  RagwIODemo
//
//  Created by Gokhan Mutlu on 23.01.2022.
//

import Foundation

struct RawgGameListJsonParser:JSonParser{
	func parse(data: Data) -> Result<RawgApiResponse, RawgApiError> {
		let decoder = JSONDecoder()
		do{
			let apiResponse = try decoder.decode(RawgApiResponse.self, from: data)
			return .success(apiResponse)
		}catch{
			print(error)
			print(error.localizedDescription)
			return .failure(.anyError(error))
		}
	}
	
	typealias T = RawgApiResponse
	typealias TError = RawgApiError
}


