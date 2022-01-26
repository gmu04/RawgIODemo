//
//  RawgGameListView.swift
//  RagwIODemo
//
//  Created by Gokhan Mutlu on 23.01.2022.
//

import SwiftUI
import Combine

struct GameListView: View {
	
	@ObservedObject var gameListVM = GameListViewModel(session: URLSession.shared)
	@State private var term:String = ""
	
	
	
	init(){
		gameListVM.search(term: "")
	}
	
    var body: some View {
		NavigationView {
		
			VStack {
				
				TextField("Search", text: Binding(
					get: { self.term },
					set: { newValue in
						self.term = newValue
						
						//new search
						if newValue.trimmingCharacters(in: .whitespacesAndNewlines).count > 3{
							self.gameListVM.search(term: self.term)
							
						}
//						//filter
//						else{
//
//
//						}
				}))
					.font(.title3)
					.padding(10)
					.textInputAutocapitalization(.never)
					.disableAutocorrection(true)
					.border(.secondary)
					.padding(.horizontal, 15)
					.padding(.vertical, 5)
					
//				Text(term)
//					.padding()
				
				
				let termTrimmed = term.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
				let isFilterGames = termTrimmed.count != 0 && termTrimmed.count <= 3
				let filteredGames =  isFilterGames ?
					gameListVM.games.filter { vm in vm.name.lowercased().contains(term) } :
					//or games that come from new search result
					gameListVM.games
				
				
				List{
					ForEach(filteredGames, id: \.id) { game in
						NavigationLink {
							GameDetailView(gameVM: game)
						} label: {
							GameCellView(game: game)
						}
					}
				}
				.listStyle(.plain)
				.navigationBarHidden(true)
			}
		}
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
		GameListView()
    }
}


