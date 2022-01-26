//
//  Game.swift
//  RawgIODemo
//
//  Created by Gokhan Mutlu on 24.01.2022.
//

import Foundation

/**
 Game is primary transition object.
 API provides lots of additional properties but for the simple demo app, following abstraction is ok.
 Basic use of codable is sufficient.
 */
struct Game:Codable{
	let id:Int
	let name:String
	let rating:Double
	let released:String?
	let background_image:String
}

extension Game{
	static var placeholder = Game(id: 1, name: "Placeholder game", rating: 3.5, released: "2022-01-24",
								  background_image: "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg")
}
