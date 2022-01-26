//
//  GameViewModel.swift
//  RagwIODemo
//
//  Created by Gokhan Mutlu on 23.01.2022.
//

import Foundation

struct GameViewModel:Identifiable{
	
	private let game:Game
	init(game:Game){ self.game = game }
	
	var id:Int{ return game.id }
	var name:String{ return game.name }
	var rating:Double{ return game.rating }
	var released:String{ return game.released ?? "-" }
	var imageUrlStr:String{ return game.background_image }
}
