//
//  GameOverView.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/11.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var gameSetting: GameSetting
    
    var body: some View {
        VStack {
            Spacer()
            Text("Congratuation!")
            if gameSetting.gameOverP1Score > gameSetting.gameOverP2Score {
                Text("Player 1")
            } else {
                Text("Player 2")
            }
            Text("YOU WON!")
            Spacer()
            Text("Player 1 : \(gameSetting.gameOverP1Score)")
            Text("Player 2 : \(gameSetting.gameOverP2Score)")
        }
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(gameSetting: GameSetting())
    }
}
