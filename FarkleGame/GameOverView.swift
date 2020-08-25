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
            if gameSetting.vsComputer {
                Group {
                    Spacer()
                    if gameSetting.gameOverP1Score > gameSetting.gameOverP2Score {
                        Text("Congratuation!")
                        Text(gameSetting.playerName)
                        Text("YOU WON!")
                    } else {
                        Text("GAME OVER")
                        Text("YOU LOSE!")
                    }
                    Spacer()
                    Text("\(gameSetting.playerName) : \(gameSetting.gameOverP1Score)")
                    Text("COM : \(gameSetting.gameOverP2Score)")
                }
            } else {
                Group {
                    Spacer()
                    Text("Congratuation!")
                    if gameSetting.gameOverP1Score > gameSetting.gameOverP2Score {
                        Text(gameSetting.playerName)
                    } else {
                        Text("Player 2")
                    }
                    Text("YOU WON!")
                    Spacer()
                    Text("\(gameSetting.playerName) : \(gameSetting.gameOverP1Score)")
                    Text("Player 2 : \(gameSetting.gameOverP2Score)")
                }
            }
        }
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(gameSetting: GameSetting())
    }
}
