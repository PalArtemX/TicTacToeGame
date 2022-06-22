//
//  XOButtonView.swift
//  TicTacToeGame
//
//  Created by Artem Paliutin on 21/06/2022.
//

import SwiftUI

struct XOButtonView: View {
    let systemName: String
    let color: Color
    let action: () -> ()
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100)
                .foregroundColor(color)
                .shadow(radius: 5)
            
            Button {
                action()
            } label: {
                Image(systemName: systemName)
                    .symbolRenderingMode(.hierarchical)
                    .font(.system(size: 72))
                    .foregroundColor(.white)
            }
            
        }
    }
}










struct XOButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            XOButtonView(systemName: "xmark", color: .green, action: {})
            XOButtonView(systemName: "circle", color: .red, action: {})
            XOButtonView(systemName: "hand.tap", color: .primary.opacity(0.2), action: {})
        }
        
    }
}
