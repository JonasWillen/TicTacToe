//
//  MainView.swift
//  TicTacToe
//
//  Created by Jonas Willén on 2025-10-15.
//



import SwiftUI

struct MainView: View {
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
    MainView()
        .environmentObject(TicTacToeVM())
}
