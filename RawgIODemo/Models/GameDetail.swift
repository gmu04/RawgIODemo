//
//  GameDetail.swift
//  RawgIODemo
//
//  Created by Gokhan Mutlu on 24.01.2022.
//

import Foundation

/**
 
 */
struct GameDetail:Decodable{
	let id:Int
	let name:String
	let description_raw:String
}

extension GameDetail{
	static var placeholder = GameDetail(id: 1, name: "Placeholder game", description_raw: "Placeholder game - Placeholder game - Placeholder game - Placeholder game")
}
