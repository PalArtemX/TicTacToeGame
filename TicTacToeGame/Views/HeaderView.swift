//
//  HeaderView.swift
//  TicTacToeGame
//
//  Created by Artem Paliutin on 23/06/2022.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var ticTacToeVM: TicTacToeVM
    @Namespace private var namespace
    
    var body: some View {
        Group {
            if ticTacToeVM.isShowHeader {
                HStack {
                    Spacer()
                    Text("Tic")
                        .foregroundColor(.blue)
                        .matchedGeometryEffect(id: "1", in: namespace)
                        
                    Spacer()
                    Text("Tac")
                        .foregroundColor(.yellow)
                        .matchedGeometryEffect(id: "2", in: namespace)
                        
                    Spacer()
                    Text("Toe")
                        .foregroundColor(.red)
                        .matchedGeometryEffect(id: "3", in: namespace)
                        
                    Spacer()
                }
            } else {
                VStack {
                    Spacer()
                    Text("Tic")
                        .foregroundColor(.blue)
                        .matchedGeometryEffect(id: "1", in: namespace)
                    Spacer()
                    Text("Tac")
                        .foregroundColor(.yellow)
                        .matchedGeometryEffect(id: "2", in: namespace)
                    Spacer()
                    
                    Text("Toe")
                        .foregroundColor(.red)
                        .matchedGeometryEffect(id: "3", in: namespace)
                    Spacer()
                }
            }
        }
        .frame(height: 200)
        .font(.largeTitle)
        .animation(.easeInOut(duration: 0.5), value: ticTacToeVM.isShowHeader)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .environmentObject(TicTacToeVM())
    }
}
