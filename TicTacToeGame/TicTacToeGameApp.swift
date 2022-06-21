//
//  TicTacToeGameApp.swift
//  TicTacToeGame
//
//  Created by Artem Paliutin on 21/06/2022.
//

import SwiftUI

@main
struct TicTacToeGameApp: App {
    @StateObject var ticTacToeVM = TicTacToeVM()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(ticTacToeVM)
        }
    }
}
