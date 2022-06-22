//
//  Alert.swift
//  TicTacToeGame
//
//  Created by Artem Paliutin on 22/06/2022.
//

import SwiftUI


struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}


struct AlertContext {
    static let humanWin = AlertItem(
        title: Text("You Win!"),
        message: Text("You are so smart. You beat your own AI."),
        buttonTitle: Text("Hell yeah"))
    
    static let computerWin = AlertItem(
        title: Text("You Lost"),
        message: Text("You are not so smart. You have lost to your own AI."),
        buttonTitle: Text("Rematch"))
    
    static let draw = AlertItem(
        title: Text("Draw"),
        message: Text("man is equal to AI"),
        buttonTitle: Text("Try Again"))
    
}
