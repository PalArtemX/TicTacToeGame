//
//  Move.swift
//  TicTacToeGame
//
//  Created by Artem Paliutin on 21/06/2022.
//

import Foundation


struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}
