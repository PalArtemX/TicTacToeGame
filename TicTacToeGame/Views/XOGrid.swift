//
//  XOGrid.swift
//  TicTacToeGame
//
//  Created by Artem Paliutin on 21/06/2022.
//

import SwiftUI

struct XOGrid: View {
    @EnvironmentObject var ticTacToeVM: TicTacToeVM
    @State private var grid: [[Int]] = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    
    var body: some View {
        Grid(horizontalSpacing: 15, verticalSpacing: 15) {
            ForEach(Game.grid, id: \.self) { rows in
                GridRow {
                    ForEach(rows, id: \.self) { index in
                        ZStack {
                            XOButtonView(systemName: ticTacToeVM.moves[index]?.indicator ?? "info") {
                                ticTacToeVM.processPlayerMove(for: index)
                            }
                        }
                    }
                }
            }
        }
        .disabled(ticTacToeVM.isGameBoardDisabled)
        .alert(item: $ticTacToeVM.alertItem) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: .destructive(alertItem.buttonTitle, action: { ticTacToeVM.resetGame() }))
        }
    }
    

}










struct XOGrid_Previews: PreviewProvider {
    static var previews: some View {
        XOGrid()
            .environmentObject(TicTacToeVM())
    }
}
