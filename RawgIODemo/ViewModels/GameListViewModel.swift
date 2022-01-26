//
//  RawgGameListViewModel.swift
//  RagwIODemo
//
//  Created by Gokhan Mutlu on 23.01.2022.
//

import SwiftUI
import Combine

class GameListViewModel<S:Session>:ObservableObject{
	
	@Published var games = [GameViewModel]()
	
	private var service:RawgService<S>!
	private let cacheManager = CacheManager.shared
	
	
	init(session:S){
		self.service = RawgService(session: session, cacheManager)
		
		//call service to cache games...
		
	}
	
	func search(term:String){
		self.service.searchFor(term) { result in
			switch result {
				
				case .failure(let err):
					//FIXME: edge case - what is the best solution here?
					print(err)
					
				case .success(let games):
					//print("\n------\(term)------")
					DispatchQueue.main.async {
						self.games = games.map{ GameViewModel(game: $0) }
						//print(games)
					}					
			}
		}
	}
}
