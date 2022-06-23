//
//  TicTacToeVM.swift
//  TicTacToeGame
//
//  Created by Artem Paliutin on 21/06/2022.
//

import SwiftUI

class TicTacToeVM: ObservableObject {
    @Published private(set) var moves: [Game?] = Array(repeating: nil, count: 9)
    @Published private(set) var isGameBoardDisabled = false
    @Published var alertItem: AlertItem?
    @Published var isShowHeader = false
    
    
    // MARK: - Functions
    // MARK: processPlayerMove
    func processPlayerMove(for position: Int) {
        if isSquareOccupied(in: moves, forIndex: position) {
            isShowHeader = true
            return
        }
        moves[position] = Game(player: .human, boardIndex: position)
        
        if checkWinCondition(for: .human, in: moves) {
            alertItem = AlertContext.humanWin
            isShowHeader = true
            return
        }
        
        if checkForDraw(in: moves) {
            alertItem = AlertContext.draw
            isShowHeader = true
            return
        }
        
        isGameBoardDisabled = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            let computerPosition = determineComputerMovePosition(in: moves)
            moves[computerPosition] = Game(player: .computer, boardIndex: computerPosition)
            isGameBoardDisabled = false
            
            if checkWinCondition(for: .computer, in: moves) {
                alertItem = AlertContext.computerWin
                return
            }
            
            if checkForDraw(in: moves) {
                alertItem = AlertContext.draw
                return
            }
        }
    }
    
    // MARK: resetGame
    func resetGame() {
        isShowHeader = false
        moves = Array(repeating: nil, count: 9)
    }
    
    // MARK: isSquareOccupied
    private func isSquareOccupied(in moves: [Game?], forIndex index: Int) -> Bool {
        return moves.contains(where: { $0?.boardIndex == index })
    }
    
    // MARK: determineComputerMovePosition
    // If AI can win, then win
    // If AI can't win, then block
    // If AI can't block, then take middle square
    // If AI can't take middle square, take random available square
    private func determineComputerMovePosition(in moves: [Game?]) -> Int {
        
        // If AI can win, then win
        let winPatterns: Set<Set<Int>> = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 9], [0, 4, 8], [2, 4, 6]
        ]
        let computerMoves = moves.compactMap { $0 }.filter { $0.player == .computer }
        let computerPositions = Set(computerMoves.map { $0.boardIndex })
        
        for pattern in winPatterns {
            let winPosition = pattern.subtracting(computerPositions)
            
            if winPosition.count == 1 {
                let isAvailable = !isSquareOccupied(in: moves, forIndex: winPosition.first!)
                if isAvailable {
                    return winPosition.first!
                }
            }
        }
        // If AI can't win, then block
        let humanMoves = moves.compactMap { $0 }.filter { $0.player == .human }
        let humanPositions = Set(humanMoves.map { $0.boardIndex })
        
        for pattern in winPatterns {
            let winPosition = pattern.subtracting(humanPositions)
            
            if winPosition.count == 1 {
                let isAvailable = !isSquareOccupied(in: moves, forIndex: winPosition.first!)
                if isAvailable {
                    return winPosition.first!
                }
            }
        }
        
        // If AI can't block, then take middle square
        let centerSquare = 4
        if !isSquareOccupied(in: moves, forIndex: centerSquare) {
            return centerSquare
        }
        
        // If AI can't take middle square, take random available square
        var movePosition = Int.random(in: 0..<9)
        
        while isSquareOccupied(in: moves, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        isShowHeader = true
        return movePosition
    }
    
    // MARK: checkWinCondition
    private func checkWinCondition(for player: Player, in moves: [Game?]) -> Bool {
        let winPatterns: Set<Set<Int>> = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 9], [0, 4, 8], [2, 4, 6]
        ]
        
        let playerMoves = moves.compactMap { $0 }.filter { $0.player == player }
        let playerPositions = Set(playerMoves.map { $0.boardIndex })
        
        for pattern in winPatterns where pattern.isSubset(of: playerPositions) {
            return true
        }
        isShowHeader = true
        return false
    }
    
    // MARK: checkForDraw
    private func checkForDraw(in moves: [Game?]) -> Bool {
        return moves.compactMap { $0 }.count == 9
    }
    
}
