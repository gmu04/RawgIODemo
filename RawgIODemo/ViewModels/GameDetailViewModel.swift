//
//  GameDetailViewModel.swift
//  RawgIODemo
//
//  Created by Gokhan Mutlu on 24.01.2022.
//

import SwiftUI
import Combine

class GameDetailViewModel<S:Session>:ObservableObject{
	
	@Published var description:String = ""
	
	private var service:RawgService<S>!
	
	init(session:S){
		self.service = RawgService(session: session)
	}
	
	func getGameDetail(byId gameId:Int){
		self.service.getGameDetail(byId:gameId) { result in
			switch result {
				
				case .failure(let err):
					//FIXME: edge case - what is the best solution here?
					print(err)
					
				case .success(let gameDetail):
					DispatchQueue.main.async {
						self.description = gameDetail.description_raw
					}
			}
		}
	}
	
}

