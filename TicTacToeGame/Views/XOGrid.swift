//
//  XOGrid.swift
//  TicTacToeGame
//
//  Created by Artem Paliutin on 21/06/2022.
//

import SwiftUI

struct XOGrid: View {
    @EnvironmentObject var TicTacToeVM: TicTacToeVM
    @State private var grid: [[Int]] = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    
    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
    @State private var isGameBoardDisabled = false
    
    var body: some View {
        Grid(horizontalSpacing: 15, verticalSpacing: 15) {
            ForEach(grid, id: \.self) { rows in
                GridRow {
                    ForEach(rows, id: \.self) { index in
                        ZStack {
                            
                            XOButtonView() {
                                print("\(index)")
                                if isSquareOccupied(in: moves, forIndex: index) {
                                    return
                                }
                                moves[index] = Move(player: .human, boardIndex: index)
                                
                                isGameBoardDisabled = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    let computerPosition = determineComputerMovePosition(in: moves)
                                    moves[computerPosition] = Move(player: .computer, boardIndex: computerPosition)
                                    isGameBoardDisabled = false
                                }
                            }
                            
                            Image(systemName: moves[index]?.indicator ?? "")
                                .font(.largeTitle)
                        }
                    }
                }
            }
        }
        .disabled(isGameBoardDisabled)
    }
    
    func isSquareOccupied(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: { $0?.boardIndex == index })
    }
    
    func determineComputerMovePosition(in moves: [Move?]) -> Int {
        var movePosition = Int.random(in: 0..<9)
        
        while isSquareOccupied(in: moves, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        
        return movePosition
    }
}










struct XOGrid_Previews: PreviewProvider {
    static var previews: some View {
        XOGrid()
            .environmentObject(TicTacToeVM())
    }
}
