//
//  GameCellView.swift
//  RawgIODemo
//
//  Created by Gokhan Mutlu on 24.01.2022.
//

import SwiftUI

struct GameCellView: View {
	let game:GameViewModel
	
	var body: some View {
		HStack() {
			if
				let urlString = game.imageUrlStr,
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
								
						
						case .failure:
							AsyncImage(url: url) { phase in
								if let image = phase.image {
									image
										.resizable()
										.scaledToFill()
									
								} else {
									
									Image(systemName: "gamecontroller.fill")
								}
							}
							
							
						@unknown default:
							EmptyView()
					}
				}
				.frame(maxWidth: 100, maxHeight: 80)
				.cornerRadius(5)
				.shadow(color: .gray, radius:5)

				
			}else{
				Image(systemName: "gamecontroller.fill")
					.padding(2)
			}
			
			
			VStack(alignment:.leading, spacing:5) {
				Text(game.name)
				
				HStack(spacing:5) {
					Text("Rating:")
					Text(String(format: "%.1f", game.rating))
						.bold()
					Text(", \(game.released)")
				}
				.foregroundColor(.secondary)
				.font(.caption)

			}
			
		}
	}
}

struct GameCellView_Previews: PreviewProvider {
    static var previews: some View {
		GameCellView(game:GameViewModel(game: Game.placeholder))
			.previewLayout(.sizeThatFits)
    }
}
