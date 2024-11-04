//
//  Marker.swift
//  TicTacToe
//
//  Created by Jonas Willén on 2024-11-04.
//

import SwiftUI

import SwiftUI

struct Marker: View {
   @EnvironmentObject var theViewModel : TicTacToeVM

    var marker : Int
    var id : Int
    
    var body: some View {
        Button {
           theViewModel.aMove(position: id)
        } label: {
            if(marker == 1){
                Circle().stroke(Color(.red), lineWidth: 10)
            }else if(marker == 2){
                ZStack{
                    Rectangle()
                        .fill(Color(.gray))
                        .cornerRadius(10)
                        .rotationEffect(Angle(degrees: 45))
                        .frame(width: 10, height: 110, alignment: .center)
                    Rectangle()
                        .fill(Color(.gray))
                        .cornerRadius(10)
                        .rotationEffect(Angle(degrees: 135))
                        .frame(width: 10, height: 110, alignment: .center)
                }
            }else{
                Rectangle().fill(Color(.white))
            }
        }
        .frame(width: 75, height: 75, alignment: .center)
    }
}


struct Marker_Previews: PreviewProvider {
    static var previews: some View {
        Marker(marker:2, id: 1)
           .environmentObject(TicTacToeVM())
    }
}
