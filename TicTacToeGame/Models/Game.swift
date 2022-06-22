//
//  Game.swift
//  TicTacToeGame
//
//  Created by Artem Paliutin on 21/06/2022.
//

import Foundation


struct Game {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
    
    static let grid: [[Int]] = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
}
