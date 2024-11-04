//
//  TicTacToeVM.swift
//  TicTacToe
//
//  Created by Jonas Willén on 2024-11-04.
//

import Foundation

class TicTacToeVM : ObservableObject {
    var theModel = TicTacToeModel()
    @Published var markers : [aMarker] = initMarkers()
   
    private let voice = VoiceIO()
    
    
    func resetGame(){
        markers = initMarkers()
        theModel.resetGame()
    }
    
    
    func aMove(position: Int){
        print("aMove: \(position)")
        let res = theModel.aMove(position: position)
        if res != 0 {
            markers[position].state = res
            voice.speech(tile: res)
            let count = theModel.count
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                self.hurryUP(moves: count)
            }
        }
        
    }
    
    func hurryUP(moves: Int){
        print("moves: \(moves) ModelMoves: \(theModel.count)")
        if moves == theModel.count && moves < 10 {
            voice.speech(tile: 3)
        }
    }
    
    func getTile(position: Int) -> Int{
        return theModel.gameState[position];
    }
    
    func checkWinner() -> Int{
        return theModel.checkWinner()
        
    }
    
    
    // IO handling
    
    // Do voice here 
    
    
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


