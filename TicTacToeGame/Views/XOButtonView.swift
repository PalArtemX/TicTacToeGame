//
//  XOButtonView.swift
//  TicTacToeGame
//
//  Created by Artem Paliutin on 21/06/2022.
//

import SwiftUI

struct XOButtonView: View {
    let xo: XO
    let action: () -> ()
    
    var systemName: String {
        switch xo {
        case .x:
            return "multiply.circle"
        case .o:
            return "circle"
        }
    }
    
    var color: Color {
        switch xo {
        case .x:
            return .yellow
        case .o:
            return .orange
        }
    }
    
    var body: some View {
        Image(systemName: systemName)
            .symbolRenderingMode(.hierarchical)
            .font(.system(size: 72))
            .foregroundColor(color)
    }
}










struct XOButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20.0) {
            XOButtonView(xo: .o, action: {})
            XOButtonView(xo: .x, action: {})
        }
    }
}
