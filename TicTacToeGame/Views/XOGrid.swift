//
//  XOGrid.swift
//  TicTacToeGame
//
//  Created by Artem Paliutin on 21/06/2022.
//

import SwiftUI

struct XOGrid: View {
    var body: some View {
        Grid {
//            ForEach(GameArea.grid, id: \.self) { rows in
//                GridRow {
//                    ForEach(rows, id: \.self) { xo in
//                        XOButtonView(xo: xo) {
//                            print("Tap >> \(xo)")
//                        }
//                    }
//                }
//            }
        }
    }
}










struct XOGrid_Previews: PreviewProvider {
    static var previews: some View {
        XOGrid()
    }
}
