//
//  RawgGameDetailJsonParser.swift
//  RawgIODemo
//
//  Created by Gokhan Mutlu on 24.01.2022.
//

import Foundation

struct RawgGameDetailJsonParser:JSonParser{
	func parse(data: Data) -> Result<GameDetail, RawgApiError> {
		let decoder = JSONDecoder()
		do{
			let apiResponse = try decoder.decode(GameDetail.self, from: data)
			return .success(apiResponse)
		}catch{
			print(error)
			print(error.localizedDescription)
			return .failure(.anyError(error))
		}
	}
	
	typealias T = GameDetail
	typealias TError = RawgApiError
}
