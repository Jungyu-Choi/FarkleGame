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
    @ObservedObject var player1 = Player(turn: true)
    @ObservedObject var player2 = Player(turn: false)
    let com = true
    
    var body: some View {
        
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            VStack (spacing: 10){
                // MARK: - SCORE VIEW
                VStack {
                    Text("MAX SCORE : \(gameSetting.settingValueOfMaxScore * 2000 + 2000)")
                        .fontWeight(.bold)
                        .padding(.all, 10)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                        .font(.title)
                    
                    VStack(alignment: .leading) {
                        Text("\(gameSetting.playerName) : \(player1.score)(\(player1.tmpScore))")
                        Text("Player 2 : \(player2.score)(\(player2.tmpScore))")
                    }
                    .padding(.top, 20)
                    .frame(width: 300.0)
                }
                Spacer()
                HStack {
                    if player1.turn {
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
                // MARK: - DICE VIEW
                HStack {
                    if player1.turn {
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
                // MARK: - TEMPORARY SCORE VIEW
                HStack {
                    Text("[")
                    if player1.turn && checkScorable(self.player1.diceArray) != nil {
                        Text(String(checkScorable(self.player1.diceArray)!))
                    } else if player2.turn && checkScorable(self.player2.diceArray) != nil {
                        Text(String(checkScorable(self.player2.diceArray)!))
                    }
                    Text("]")
                }
                Spacer()
                Button(action: {
                    print(self.player2.diceArray)
                    self.player2.computerTurn(self.player1.score, self.player2.score, self.player2.diceArray)
                }) {
                    Text("COM")
                }
                Divider()
                // MARK: - BUTTON VIEW
                HStack {
                    // MARK: - Reroll Button
                    Button(action: {
                        if self.player1.turn {
                            self.player1.tmpScore += checkScorable(self.player1.diceArray)!
                            invisibleScoredDice(self.player1.diceArray)
                            checkHotDice(self.player1.diceArray)
                        } else {
                            self.player2.tmpScore += checkScorable(self.player2.diceArray)!
                            invisibleScoredDice(self.player2.diceArray)
                            checkHotDice(self.player2.diceArray)
                        }
                        if self.player1.score + self.player1.tmpScore >= self.gameSetting.settingValueOfMaxScore * 2000 + 2000 || self.player2.score + self.player2.tmpScore >= self.gameSetting.settingValueOfMaxScore * 2000 + 2000 {
                            self.gameSetting.gameOverP1Score = self.player1.score + self.player1.tmpScore
                            self.gameSetting.gameOverP2Score = self.player2.score + self.player2.tmpScore
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
                    
                    // MARK: - End Turn Button
                    Button(action: {
                        if self.player1.turn {
                            self.player1.score += self.player1.tmpScore + checkScorable(self.player1.diceArray)!
                            endTurn(self.player1.diceArray)
                            self.player1.tmpScore = 0
                            if self.com {
                                self.player2.computerTurn(self.player1.score, self.player2.score, self.player2.diceArray)
                                endTurn(self.player2.diceArray)
                                return
                            }
                            
                        } else {
                            self.player2.score += self.player2.tmpScore + checkScorable(self.player2.diceArray)!
                            endTurn(self.player2.diceArray)
                            self.player2.tmpScore = 0
                        }
                        if self.player1.score >= self.gameSetting.settingValueOfMaxScore * 2000 + 2000 || self.player2.score >= self.gameSetting.settingValueOfMaxScore * 2000 + 2000 {
                            self.gameSetting.gameOverP1Score = self.player1.score
                            self.gameSetting.gameOverP2Score = self.player2.score
                            self.gameSetting.gameOver = true
                        }
                        self.player1.turn.toggle()
                        self.player2.turn.toggle()
                        isScorable = false
                    }) {
                        Image(systemName: "checkmark")
                            .resizable()
                            .sheet(isPresented: self.$gameSetting.gameOver) {
                                GameOverView(gameSetting: self.gameSetting)
                        }
                    }
                    .disabled(!isScorable)
                    // MARK: - Give Up Button
                    Button(action: {
                        if self.player1.turn {
                            endTurn(self.player1.diceArray)
                            self.player1.tmpScore = 0
                        } else {
                            endTurn(self.player2.diceArray)
                            self.player2.tmpScore = 0
                        }
                        self.player1.turn.toggle()
                        self.player2.turn.toggle()
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
