//
//  TextInfo.swift
//  TicTacToe
//
//  Created by Jonas Willén on 2024-11-04.
//

import SwiftUI

struct TextInfo: View {
    @EnvironmentObject var theViewModel : TicTacToeVM
    
    var body: some View {
        switch theViewModel.checkWinner(){
        case 0:
            Text("Play")
                .font(.title)
        case 1:
            Text("Circle has won!")
                .font(.title)
        case 2:
            Text("Cross has won!")
                .font(.title)
        case 3:
            Text("It's a draw!")
                .font(.title)
        default:
            Text("Start Play")
                .font(.title)
        }
    }
}

struct TextInfo_Previews: PreviewProvider {
    static var previews: some View {
        TextInfo()
            .environmentObject(TicTacToeVM())
            
    }
}

