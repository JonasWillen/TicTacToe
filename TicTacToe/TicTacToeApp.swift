//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Jonas Willén on 2024-11-04.
//

import SwiftUI

@main
struct TicTacToeApp: App {
    @StateObject private var theViewModel = TicTacToeVM()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(theViewModel)
        }
    }
}
