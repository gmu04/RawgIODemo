//
//  GameListDetailView.swift
//  RawgIODemo
//
//  Created by Gokhan Mutlu on 24.01.2022.
//

import SwiftUI

struct GameDetailView: View {

	@ObservedObject var gameDetailVM = GameDetailViewModel(session: URLSession.shared)
	var gameVM:GameViewModel
	
	
	init(gameVM:GameViewModel){
		self.gameVM = gameVM
	}
	
    var body: some View {
		VStack{
			
			if
				let urlString = gameVM.imageUrlStr,
				let url = URL(string: urlString){
				
				AsyncImage(url: url) { phase in
					switch phase {
						case .empty:
							ProgressView()
								.padding(.trailing, 20)
						case .success(let image):
							image
								.resizable()
								.scaledToFill()
								.transition(.opacity)

						case .failure:
							Image(systemName: "gamecontroller.fill")

						@unknown default:
							EmptyView()
					}
				}
				.frame(maxWidth: .infinity, minHeight: 150)
				.shadow(color: .gray, radius:5, x: 0, y: 3)
				
			
			}
			else{
				Image(systemName: "gamecontroller.fill")
					.padding(2)
			}
			
			Text(gameVM.name)
				.font(.largeTitle)
				.lineLimit(1)
				.minimumScaleFactor(0.7)
				.padding(.horizontal, 10)
				
			ScrollView{
				Text(gameDetailVM.description)
					.lineLimit(.none)
					.padding(.top,0)
					.padding(.horizontal,20)
			}
			
			Spacer()
		}
		.navigationBarTitle(""/*gameVM.name*/, displayMode: .inline)
		.onAppear {
			#if DEBUG
			gameDetailVM.getGameDetail(byId: 3328)
			#else
			gameDetailVM.getGameDetail(byId: self.gameVM.id)
			#endif
		}
    }
		
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
		GameDetailView(gameVM: GameViewModel(game: Game.placeholder))
    }
}
