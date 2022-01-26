//
//  URL + ext.swift
//  RawgIODemo
//
//  Created by Gokhan Mutlu on 25.01.2022.
//

import Foundation

extension URL{
	enum RawgUrl{
		case games(term:String)
		case gameDetail(gameId:Int)
	}
	
	static func getRawgUrl(_ rawgUrl:RawgUrl) -> URL?{
		var c = URLComponents()
		c.scheme = "https"
		c.host = "api.rawg.io"
		
		c.queryItems = [
			URLQueryItem(name: "key", value: Constants.key)
		]
		
		switch rawgUrl {
			case .gameDetail(let gameId):
				c.path = "/api/games/\(gameId)"
				
			case .games(let term):
				c.path = "/api/games"
				
				let termCleaned = term
					.components(separatedBy: .whitespacesAndNewlines)
					.joined(separator: " ")
					.trimmingCharacters(in: .whitespaces)
				
				c.queryItems?.append(URLQueryItem(name: "search", value: termCleaned))
				
				
			@unknown default:
				fatalError("Please define url in RawgUrl enum")
				
		}
		
		return c.url
	}
	
}
