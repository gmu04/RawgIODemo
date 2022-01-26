//
//  ContentView.swift
//  RawgIODemo
//
//  Created by Gokhan Mutlu on 24.01.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
	
	
	var body: some View {
		VStack {
			GameListView()
		}		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

