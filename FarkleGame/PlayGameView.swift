//
//  PlayGameView.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/08.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import SwiftUI

struct PlayGameView: View {
    @EnvironmentObject var gameSetting: GameSetting
    @State var playerScore: Int = 0
    @State var comScore: Int = 0
    var dice = DiceArrayView()
    
    func insertSortedDice() -> [Dice] {
        var array: [Dice] = []
        
        for dice in [dice.dice1, dice.dice2, dice.dice3, dice.dice4, dice.dice5, dice.dice6] {
            if dice.select {
                array.append(dice)
            }
        }
        if array.count < 2 {
            return array
        } else {
            for _ in 1...array.count {
                for index in 0...array.count-2 {
                    var tmpDice: Dice
                    if array[index].numberOfDice > array[index+1].numberOfDice {
                        tmpDice = array[index]
                        array[index] = array[index+1]
                        array[index+1] = tmpDice
                    }
                }
            }
        }
        return array
    }
    
    func invisibleScoredDice() {
        for dice in [dice.dice1, dice.dice2, dice.dice3, dice.dice4, dice.dice5, dice.dice6] {
            if dice.select {
                dice.select.toggle()
                dice.scored.toggle()
            } else {
                dice.reRollDice()
            }
        }
    }
    
    var body: some View {
        
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            VStack (spacing: 10){
                HStack {
                    Text("Hello \(gameSetting.playerName)")
                    Text("maxScore is \(gameSetting.settingValueOfMaxScore * 2000 + 2000)")
                }
                Spacer()
                HStack{
                    dice
                }

                Spacer()
                HStack {
                    Button(action: {print("debug")}) {
                        Text("DEBUG")
                    }
                }
                Divider()
                HStack {
                    Button(action: {
                        calcScore(array: self.insertSortedDice())
                        self.invisibleScoredDice()
                    }) {
                        Image(systemName: "repeat")
                            .resizable()
                    }
                    Button(action: {}) {
                        Image(systemName: "checkmark")
                            .resizable()
                    }
                    Button(action: {}) {
                        Image(systemName: "xmark")
                            .resizable()
                    }
                }
                .frame(width: 300, height: 100)
                .buttonStyle(PlainButtonStyle())
            }
        }
        
//    .navigationBarBackButtonHidden(true)
    }
}

struct PlayGameView_Previews: PreviewProvider {
    static let preview = GameSetting()
    
    static var previews: some View {
        PlayGameView().environmentObject(preview)
    }
}
