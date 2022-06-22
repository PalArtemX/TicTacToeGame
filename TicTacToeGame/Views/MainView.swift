//
//  MainView.swift
//  TicTacToeGame
//
//  Created by Artem Paliutin on 21/06/2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            XOGrid()
        }
    }
}










struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(TicTacToeVM())
    }
}
