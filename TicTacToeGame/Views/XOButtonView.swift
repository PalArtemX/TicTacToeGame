//
//  XOButtonView.swift
//  TicTacToeGame
//
//  Created by Artem Paliutin on 21/06/2022.
//

import SwiftUI

struct XOButtonView: View {
    let systemName: String
    let action: () -> ()
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100)
                .foregroundColor(.indigo)
            
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
        
        XOButtonView(systemName: "plus", action: {})
        
    }
}
