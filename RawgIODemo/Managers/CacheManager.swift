//
//  CacheManager.swift
//  RawgIODemo
//
//  Created by Gokhan Mutlu on 25.01.2022.
//

import Foundation


class CacheManager:SearchResultCacheable{
	
	private init(){ }
	static let shared = CacheManager()
	
	private(set) var store = NSCache<NSString, SearchEntry>()
	
	
	func getGames(bySearchTerm term: String) -> [Game]? {
		guard let searchStoreItem = store.object(forKey: NSString(string: term)) else { return nil }
		return searchStoreItem.games
	}
	
	func add(games:[Game], byKey term:String){
		store.removeObject(forKey: NSString(string: term))
		store.setObject(SearchEntry(games: games), forKey: NSString(string: term))
	}
	
}


protocol SearchResultCacheable{
	var store:NSCache<NSString, SearchEntry>{ get }
	
	func getGames(bySearchTerm term:String) -> [Game]?
	func add(games:[Game], byKey term:String)
}



/**
 Each search query creates a cache storage
 */
class SearchEntry:NSObject{
	var games:[Game]
	
	init(games:[Game]){
		self.games = games
	}
}
