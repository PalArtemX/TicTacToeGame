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
    @State private var isHumansTurn = true
    
    var body: some View {
        Grid(horizontalSpacing: 15, verticalSpacing: 15) {
            ForEach(grid, id: \.self) { rows in
                GridRow {
                    ForEach(rows, id: \.self) { index in
                        ZStack {
                            
                                
                            XOButtonView() {
                                print("\(index)")
                                moves[index] = Move(player: isHumansTurn ? .human : .computer, boardIndex: index)
                                isHumansTurn.toggle()
                            }
                            
                            Image(systemName: moves[index]?.indicator ?? "")
                                .font(.largeTitle)
                        }
                    }
                }
            }
        }
    }
}










struct XOGrid_Previews: PreviewProvider {
    static var previews: some View {
        XOGrid()
            .environmentObject(TicTacToeVM())
    }
}
