//
//  RawgService.swift
//  RagwIODemo
//
//  Created by Gokhan Mutlu on 23.01.2022.
//

import Foundation



final class RawgService<S:Session>{
	
	private var cacheManager:SearchResultCacheable! = nil
	

	//injecting session
	init(session:S){
		self.client = HttpClient(session: session)
	}
	
	//injecting session + cache manager
	convenience init(session:S, _ cacheManager:CacheManager){//CacheManager? = nil){
		self.init(session: session)
		self.cacheManager = cacheManager
	}
	
	
	internal func searchFor(_ term:String, completion:@escaping (Result<[Game], RawgApiError>)->()){
		
		//check cache store
		if let cacheManager = cacheManager, let games = cacheManager.getGames(bySearchTerm: term){
			//Search term found in cache
			return completion(.success(games))
		}
		
		//prepare search url
		guard let validUrl = URL.getRawgUrl(
			.games(term: term)) else { fatalError("Url is not valid!") }
		
		//call API client to search
		client.searchFor(url: validUrl){ result in
			
			switch result{
				case .failure(let RawgApiError):
					completion(.failure(RawgApiError))
				
				case .success(let data):
					
					let result = RawgGameListJsonParser().parse(data: data)

					//return games
					if case let .success(rawgApiResponse) = result{
						//print(rawgApiResponse.results)
						
						//insert search result info cache store
						if let cacheManager = self.cacheManager{
							cacheManager.add(games:rawgApiResponse.results, byKey: term)
						}
						
						completion(.success(rawgApiResponse.results))
					}else{
						completion(.failure(.jsonParsing("Check the logs...")))
					}
			}
		}
		
	}
	
	internal func getGameDetail(byId gameId:Int, completion:@escaping (Result<GameDetail, RawgApiError>)->()){
		
		//prepare search url
		guard let validUrl = URL.getRawgUrl(
			.gameDetail(gameId: gameId)) else { fatalError("Url is not valid!") }
		
		//call API client to search
		client.searchFor(url: validUrl){ result in
			
			switch result{
				case .failure(let RawgApiError):
					completion(.failure(RawgApiError))
					
				case .success(let data):
					
					let result = RawgGameDetailJsonParser().parse(data: data)
					
					//return games
					if case let .success(gameDetail) = result{
						//print(rawgApiResponse.results)
						completion(.success(gameDetail))
					}else{
						completion(.failure(.jsonParsing("Check the logs...")))
					}
			}
		}
		
	}
	
	
	
	//MARK: - Properties
	
	private var games:[Game]?
	private let client:HttpClient<S>
	
}





