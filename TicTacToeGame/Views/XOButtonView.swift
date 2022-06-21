//
//  XOButtonView.swift
//  TicTacToeGame
//
//  Created by Artem Paliutin on 21/06/2022.
//

import SwiftUI

struct XOButtonView: View {
    //let xo: GameArea
    let action: () -> ()
    
    //    var systemName: String {
    //        switch xo {
    //        case .x:
    //            return "multiply.circle"
    //        case .o:
    //            return "circle"
    //        case .none:
    //            return "circle.fill"
    //        }
    //    }
    //
    //    var color: Color {
    //        switch xo {
    //        case .x:
    //            return .yellow
    //        case .o:
    //            return .orange
    //        case .none:
    //            return .red
    //        }
    //    }
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 96)
                .foregroundColor(.orange)
            
            
            Button {
                action()
            } label: {
                Image(systemName: "xmark")
                    .symbolRenderingMode(.hierarchical)
                    .font(.system(size: 72))
                    .foregroundColor(.white)
            }
        }
    }
}










struct XOButtonView_Previews: PreviewProvider {
    static var previews: some View {
        
            XOButtonView(action: {})
        
    }
}
