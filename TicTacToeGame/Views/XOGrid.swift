//
//  XOGrid.swift
//  TicTacToeGame
//
//  Created by Artem Paliutin on 21/06/2022.
//

import SwiftUI

struct XOGrid: View {
    @EnvironmentObject var ticTacToeVM: TicTacToeVM
    
    var body: some View {
        Grid(horizontalSpacing: 15, verticalSpacing: 15) {
            ForEach(Game.grid, id: \.self) { rows in
                GridRow {
                    ForEach(rows, id: \.self) { index in
                        ZStack {
                            XOButtonView(
                                systemName: ticTacToeVM.moves[index]?.indicator ?? "hand.tap",
                                color: ticTacToeVM.moves[index]?.color ?? .primary.opacity(0.15)) {
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
