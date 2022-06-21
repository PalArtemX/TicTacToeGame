//
//  XOGrid.swift
//  TicTacToeGame
//
//  Created by Artem Paliutin on 21/06/2022.
//

import SwiftUI

struct XOGrid: View {
    @EnvironmentObject var TicTacToeVM: TicTacToeVM
    @State private var grid: [[Int]] = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    
    var body: some View {
        Grid(horizontalSpacing: 15, verticalSpacing: 15) {
            ForEach(grid, id: \.self) { rows in
                GridRow {
                    ForEach(rows, id: \.self) { columns in
                        XOButtonView {
                            print("\(columns)")
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
