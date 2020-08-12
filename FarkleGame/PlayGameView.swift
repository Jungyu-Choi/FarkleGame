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
    @State var turn: Bool = true // p1 = true, p2 = false
    @State var p1Score: Int = 0
    @State var p2Score: Int = 0
    @State var p1TmpScore: Int = 0
    @State var p2TmpScore: Int = 0
    @State var giveUpCounter: Int = 0
    
    @ObservedObject var player1 = Player()
    @ObservedObject var player2 = Player()
    var body: some View {
        
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            VStack (spacing: 10){
                VStack {
                    Text("MAX SCORE : \(gameSetting.settingValueOfMaxScore * 2000 + 2000)")
                        .fontWeight(.bold)
                        .padding(.all, 10)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                        .font(.title)

                    VStack(alignment: .leading) {
                        Text("\(gameSetting.playerName) : \(p1Score)(\(p1TmpScore))")
                        Text("Player 2 : \(p2Score)(\(p2TmpScore))")
                    }
                    .padding(.top, 20)
                    .frame(width: 300.0)
                }
                Spacer()
                HStack {
                    if turn {
                        Text("\(gameSetting.playerName) turn")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.all, 10)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    } else {
                        Text("Player 2 turn")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.all, 10)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    }
                }
                HStack {
                    if turn {
                        ForEach(self.player1.diceArray, id:\.self.id) { dice in
                            Group {
                                if !dice.scored {
                                    Button(action: {
                                        dice.select.toggle()
                                        self.player1.reloadView.toggle()
                                        if checkScorable(self.player1.diceArray) == -1 {
                                            isScorable = false
                                        } else {
                                            isScorable = true
                                        }
                                    }) {
                                        Image(dice.imageName)
                                        .resizable()
                                        .frame(width: 50, height: 100)
                                    }
                                }
                            }
                        }
                    } else {
                        ForEach(self.player2.diceArray, id:\.self.id) { dice in
                            Group {
                                if !dice.scored {
                                    Button(action: {
                                        dice.select.toggle()
                                        self.player2.reloadView.toggle()
                                        if checkScorable(self.player2.diceArray) == -1 {
                                            isScorable = false
                                        } else {
                                            isScorable = true
                                        }
                                    }) {
                                        Image(dice.imageName)
                                        .resizable()
                                        .frame(width: 50, height: 100)
                                    }
                                }
                            }
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
                HStack {
                    Text("[")
                    if self.turn && checkScorable(self.player1.diceArray) != -1 {
                        Text(String(checkScorable(self.player1.diceArray)))
                    } else if !self.turn && checkScorable(self.player2.diceArray) != -1 {
                        Text(String(checkScorable(self.player2.diceArray)))
                    }
                    Text("]")
                }
                Spacer()
                Divider()
                HStack {
                    Button(action: {
                        if self.turn {
                            self.p1TmpScore += checkScorable(self.player1.diceArray)
                            invisibleScoredDice(self.player1.diceArray)
                            checkHotDice(self.player1.diceArray)
                        } else {
                            self.p2TmpScore += checkScorable(self.player2.diceArray)
                            invisibleScoredDice(self.player2.diceArray)
                            checkHotDice(self.player2.diceArray)
                        }
                        if self.p1Score + self.p1TmpScore >= self.gameSetting.settingValueOfMaxScore * 2000 + 2000 || self.p2Score + self.p2TmpScore >= self.gameSetting.settingValueOfMaxScore * 2000 + 2000 {
                            self.gameSetting.gameOverP1Score = self.p1Score + self.p1TmpScore
                            self.gameSetting.gameOverP2Score = self.p2Score + self.p2TmpScore
                            self.gameSetting.gameOver = true
                        }
                    }) {
                        Image(systemName: "repeat")
                            .resizable()
                            .sheet(isPresented: self.$gameSetting.gameOver) {
                                GameOverView(gameSetting: self.gameSetting)
                            }
                    }
                    .disabled(!isScorable)
                    
                    Button(action: {
                        if self.turn {
                            self.p1Score += self.p1TmpScore + checkScorable(self.player1.diceArray)
                            endTurn(self.player1.diceArray)
                            self.p1TmpScore = 0
                        } else {
                            self.p2Score += self.p2TmpScore + checkScorable(self.player2.diceArray)
                            endTurn(self.player2.diceArray)
                            self.p2TmpScore = 0
                        }
                        if self.p1Score >= self.gameSetting.settingValueOfMaxScore * 2000 + 2000 || self.p2Score >= self.gameSetting.settingValueOfMaxScore * 2000 + 2000 {
                            self.gameSetting.gameOverP1Score = self.p1Score
                            self.gameSetting.gameOverP2Score = self.p2Score
                            self.gameSetting.gameOver = true
                        }
                        self.turn.toggle()
                        isScorable = false
                    }) {
                        Image(systemName: "checkmark")
                            .resizable()
                            .sheet(isPresented: self.$gameSetting.gameOver) {
                                GameOverView(gameSetting: self.gameSetting)
                        }
                    }
                    .disabled(!isScorable)
                    
                    Button(action: {
                        self.giveUpCounter += 1
                        if self.giveUpCounter == 2 {
                            endTurn(self.player1.diceArray)
                            endTurn(self.player2.diceArray)
                            self.p1TmpScore = 0
                            self.p2TmpScore = 0
                            self.turn.toggle()
                            self.giveUpCounter = 0
                        } else if self.turn {
                            endTurn(self.player1.diceArray)
                            self.p1TmpScore = 0
                            self.turn.toggle()
                        } else {
                            endTurn(self.player2.diceArray)
                            self.p2TmpScore = 0
                            self.turn.toggle()
                        }
                    }) {
                        Image(systemName: "xmark")
                            .resizable()
                    }
                }
                .frame(width: 300, height: 100)
                .buttonStyle(PlainButtonStyle())
            }
        }
    .navigationBarBackButtonHidden(true)
    }
}

struct PlayGameView_Previews: PreviewProvider {
    static let preview = GameSetting()
    
    static var previews: some View {
        PlayGameView().environmentObject(preview)
    }
}
