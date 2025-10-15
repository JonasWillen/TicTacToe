//
//  TicTacToeVM.swift
//  TicTacToe
//
//  Created by Jonas Willén on 2024-11-04.
//

import Foundation

@MainActor
class TicTacToeVM : ObservableObject {
    // Handles the model
    private var theModel = TicTacToeModel()
    // Handle convertions between model and view
    @Published var markers : [aMarker] = initMarkers()
    //Handels other IO handling like Voice, Networking, ...
    private let voice : VoiceIO = VoiceIO()
    
    
    func resetGame(){
        markers = initMarkers()
        theModel.resetGame()
    }
    
    
    func aMove(position: Int){
        print("aMove: \(position)")
        let res = theModel.aMove(position: position)
        if res != 0 {
            markers[position].state = res
            if (res == 1){
                voice.speakCircle()
            }else{
                voice.speakCross()
            }
            let count = theModel.count
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                self.hurryUP(moves: count)
            }
        }
        
    }
    
    func hurryUP(moves: Int){
        print("moves: \(moves) ModelMoves: \(theModel.count)")
        if moves == theModel.count && moves < 10 {
            voice.speakTheString(theString: "Time to place a marker")
        }
    }
    
    func getTile(position: Int) -> Int{
        return theModel.gameState[position];
    }
    
    func checkWinner() -> Int{
        return theModel.checkWinner()
        
    }

}

func initMarkers() -> [aMarker] {
    print("start")
    return [
        aMarker(id: 0, state: 0, x: 0, y: 0),
        aMarker(id: 1, state: 0, x: 1, y: 0),
        aMarker(id: 2, state: 0, x: 2, y: 0),
        aMarker(id: 3, state: 0, x: 0, y: 1),
        aMarker(id: 4, state: 0, x: 1, y: 1),
        aMarker(id: 5, state: 0, x: 2, y: 1),
        aMarker(id: 6, state: 0, x: 0, y: 2),
        aMarker(id: 7, state: 0, x: 1, y: 2),
        aMarker(id: 8, state: 0, x: 2, y: 2)
    ]
}


struct aMarker: Hashable, Codable, Identifiable {
    var id: Int
    var state : Int
    var x: Int
    var y: Int
}

