//
//  ContentView.swift
//  TicTacToe
//
//  Created by Jonas Willén on 2024-11-04.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var theViewModel : TicTacToeVM

    var body: some View {
        VStack {
            TextInfo()
                .padding()
            
            BoardView()
            
            Button {
                theViewModel.resetGame()
            } label: {
                Text("Reset")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(TicTacToeVM())
}
