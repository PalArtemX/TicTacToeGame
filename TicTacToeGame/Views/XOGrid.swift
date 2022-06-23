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
                    ForEach(rows, id: \.self) { i in
                        XOButtonView(
                            systemName: ticTacToeVM.moves[i]?.indicator ?? "hand.tap",
                            color: ticTacToeVM.moves[i]?.color ?? .yellow.opacity(0.15)) {
                                
                                ticTacToeVM.processPlayerMove(for: i)
                                print("🔘 Tap button for index >> |\(i)|")
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
                dismissButton: .destructive(alertItem.buttonTitle) {
                    ticTacToeVM.resetGame()
                }
            )
        }
    }
    
}










struct XOGrid_Previews: PreviewProvider {
    static var previews: some View {
        XOGrid()
            .environmentObject(TicTacToeVM())
    }
}
