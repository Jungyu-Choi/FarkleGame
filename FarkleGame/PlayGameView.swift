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
    
    @ObservedObject var p1Dice1: Dice = Dice(num: Int.random(in: (1...6)))
    @ObservedObject var p1Dice2: Dice = Dice(num: Int.random(in: (1...6)))
    @ObservedObject var p1Dice3: Dice = Dice(num: Int.random(in: (1...6)))
    @ObservedObject var p1Dice4: Dice = Dice(num: Int.random(in: (1...6)))
    @ObservedObject var p1Dice5: Dice = Dice(num: Int.random(in: (1...6)))
    @ObservedObject var p1Dice6: Dice = Dice(num: Int.random(in: (1...6)))
    
    @ObservedObject var p2Dice1: Dice = Dice(num: Int.random(in: (1...6)))
    @ObservedObject var p2Dice2: Dice = Dice(num: Int.random(in: (1...6)))
    @ObservedObject var p2Dice3: Dice = Dice(num: Int.random(in: (1...6)))
    @ObservedObject var p2Dice4: Dice = Dice(num: Int.random(in: (1...6)))
    @ObservedObject var p2Dice5: Dice = Dice(num: Int.random(in: (1...6)))
    @ObservedObject var p2Dice6: Dice = Dice(num: Int.random(in: (1...6)))
    
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
                        if !self.p1Dice1.scored {
                            Button(action: {
                                self.p1Dice1.select.toggle()
                                if checkScorable(insertSortedDice([self.p1Dice1, self.p1Dice2, self.p1Dice3, self.p1Dice4, self.p1Dice5, self.p1Dice6])) == -1 {
                                    isScorable = false
                                } else {
                                    isScorable = true
                                }
                            }) {
                                Image(self.p1Dice1.imageName)
                                .resizable()
                                .frame(width: 50, height: 100)
                            }
                        }
                        if !self.p1Dice2.scored {
                            Button(action: {
                                self.p1Dice2.select.toggle()
                                if checkScorable(insertSortedDice([self.p1Dice1, self.p1Dice2, self.p1Dice3, self.p1Dice4, self.p1Dice5, self.p1Dice6])) == -1 {
                                    isScorable = false
                                } else {
                                    isScorable = true
                                }
                            }) {
                                Image(self.p1Dice2.imageName)
                                .resizable()
                                .frame(width: 50, height: 100)
                            }
                        }
                        if !self.p1Dice3.scored {
                            Button(action: {
                                self.p1Dice3.select.toggle()
                                if checkScorable(insertSortedDice([self.p1Dice1, self.p1Dice2, self.p1Dice3, self.p1Dice4, self.p1Dice5, self.p1Dice6])) == -1 {
                                    isScorable = false
                                } else {
                                    isScorable = true
                                }
                            }) {
                                Image(self.p1Dice3.imageName)
                                .resizable()
                                .frame(width: 50, height: 100)
                            }
                        }
                        if !self.p1Dice4.scored {
                            Button(action: {
                                self.p1Dice4.select.toggle()
                                if checkScorable(insertSortedDice([self.p1Dice1, self.p1Dice2, self.p1Dice3, self.p1Dice4, self.p1Dice5, self.p1Dice6])) == -1 {
                                    isScorable = false
                                } else {
                                    isScorable = true
                                }
                            }) {
                                Image(self.p1Dice4.imageName)
                                .resizable()
                                .frame(width: 50, height: 100)
                            }
                        }
                        if !self.p1Dice5.scored {
                            Button(action: {
                                self.p1Dice5.select.toggle()
                                if checkScorable(insertSortedDice([self.p1Dice1, self.p1Dice2, self.p1Dice3, self.p1Dice4, self.p1Dice5, self.p1Dice6])) == -1 {
                                    isScorable = false
                                } else {
                                    isScorable = true
                                }
                            }) {
                                Image(self.p1Dice5.imageName)
                                .resizable()
                                .frame(width: 50, height: 100)
                            }
                        }
                        if !self.p1Dice6.scored {
                            Button(action: {
                                self.p1Dice6.select.toggle()
                                if checkScorable(insertSortedDice([self.p1Dice1, self.p1Dice2, self.p1Dice3, self.p1Dice4, self.p1Dice5, self.p1Dice6])) == -1 {
                                    isScorable = false
                                } else {
                                    isScorable = true
                                }
                            }) {
                                Image(self.p1Dice6.imageName)
                                .resizable()
                                .frame(width: 50, height: 100)
                            }
                        }
                    } else {
                        if !self.p2Dice1.scored {
                            Button(action: {
                                self.p2Dice1.select.toggle()
                                if checkScorable(insertSortedDice([self.p2Dice1, self.p2Dice2, self.p2Dice3, self.p2Dice4, self.p2Dice5, self.p2Dice6])) == -1 {
                                    isScorable = false
                                } else {
                                    isScorable = true
                                }
                            }) {
                                Image(self.p2Dice1.imageName)
                                .resizable()
                                .frame(width: 50, height: 100)
                            }
                        }
                        if !self.p2Dice2.scored {
                            Button(action: {
                                self.p2Dice2.select.toggle()
                                if checkScorable(insertSortedDice([self.p2Dice1, self.p2Dice2, self.p2Dice3, self.p2Dice4, self.p2Dice5, self.p2Dice6])) == -1 {
                                    isScorable = false
                                } else {
                                    isScorable = true
                                }
                            }) {
                                Image(self.p2Dice2.imageName)
                                .resizable()
                                .frame(width: 50, height: 100)
                            }
                        }
                        if !self.p2Dice3.scored {
                            Button(action: {
                                self.p2Dice3.select.toggle()
                                if checkScorable(insertSortedDice([self.p2Dice1, self.p2Dice2, self.p2Dice3, self.p2Dice4, self.p2Dice5, self.p2Dice6])) == -1 {
                                    isScorable = false
                                } else {
                                    isScorable = true
                                }
                            }) {
                                Image(self.p2Dice3.imageName)
                                .resizable()
                                .frame(width: 50, height: 100)
                            }
                        }
                        if !self.p2Dice4.scored {
                            Button(action: {
                                self.p2Dice4.select.toggle()
                                if checkScorable(insertSortedDice([self.p2Dice1, self.p2Dice2, self.p2Dice3, self.p2Dice4, self.p2Dice5, self.p2Dice6])) == -1 {
                                    isScorable = false
                                } else {
                                    isScorable = true
                                }
                            }) {
                                Image(self.p2Dice4.imageName)
                                .resizable()
                                .frame(width: 50, height: 100)
                            }
                        }
                        if !self.p2Dice5.scored {
                            Button(action: {
                                self.p2Dice5.select.toggle()
                                if checkScorable(insertSortedDice([self.p2Dice1, self.p2Dice2, self.p2Dice3, self.p2Dice4, self.p2Dice5, self.p2Dice6])) == -1 {
                                    isScorable = false
                                } else {
                                    isScorable = true
                                }
                            }) {
                                Image(self.p2Dice5.imageName)
                                .resizable()
                                .frame(width: 50, height: 100)
                            }
                        }
                        if !self.p2Dice6.scored {
                            Button(action: {
                                self.p2Dice6.select.toggle()
                                if checkScorable(insertSortedDice([self.p2Dice1, self.p2Dice2, self.p2Dice3, self.p2Dice4, self.p2Dice5, self.p2Dice6])) == -1 {
                                    isScorable = false
                                } else {
                                    isScorable = true
                                }
                            }) {
                                Image(self.p2Dice6.imageName)
                                .resizable()
                                .frame(width: 50, height: 100)
                            }
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
                HStack {
                    Text("[")
                    if self.turn && checkScorable(insertSortedDice([self.p1Dice1, self.p1Dice2, self.p1Dice3, self.p1Dice4, self.p1Dice5, self.p1Dice6])) != -1 {
                        Text(String(checkScorable(insertSortedDice([self.p1Dice1, self.p1Dice2, self.p1Dice3, self.p1Dice4, self.p1Dice5, self.p1Dice6]))))
                    } else if !self.turn && checkScorable(insertSortedDice([self.p2Dice1, self.p2Dice2, self.p2Dice3, self.p2Dice4, self.p2Dice5, self.p2Dice6])) != -1 {
                        Text(String(checkScorable(insertSortedDice([self.p2Dice1, self.p2Dice2, self.p2Dice3, self.p2Dice4, self.p2Dice5, self.p2Dice6]))))
                    }
                    Text("]")
                }
                Spacer()
                Divider()
                HStack {
                    Button(action: {
                        if self.turn {
                            self.p1TmpScore += checkScorable(insertSortedDice([self.p1Dice1, self.p1Dice2, self.p1Dice3, self.p1Dice4, self.p1Dice5, self.p1Dice6]))
                            invisibleScoredDice([self.p1Dice1, self.p1Dice2, self.p1Dice3, self.p1Dice4, self.p1Dice5, self.p1Dice6])
                            checkHotDice([self.p1Dice1, self.p1Dice2, self.p1Dice3, self.p1Dice4, self.p1Dice5, self.p1Dice6])
                        } else {
                            self.p2TmpScore += checkScorable(insertSortedDice([self.p2Dice1, self.p2Dice2, self.p2Dice3, self.p2Dice4, self.p2Dice5, self.p2Dice6]))
                            invisibleScoredDice([self.p2Dice1, self.p2Dice2, self.p2Dice3, self.p2Dice4, self.p2Dice5, self.p2Dice6])
                            checkHotDice([self.p2Dice1, self.p2Dice2, self.p2Dice3, self.p2Dice4, self.p2Dice5, self.p2Dice6])
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
                            self.p1Score += self.p1TmpScore + checkScorable(insertSortedDice([self.p1Dice1, self.p1Dice2, self.p1Dice3, self.p1Dice4, self.p1Dice5, self.p1Dice6]))
                            endTurn([self.p1Dice1, self.p1Dice2, self.p1Dice3, self.p1Dice4, self.p1Dice5, self.p1Dice6])
                            self.p1TmpScore = 0
                        } else {
                            self.p2Score += self.p2TmpScore + checkScorable(insertSortedDice([self.p2Dice1, self.p2Dice2, self.p2Dice3, self.p2Dice4, self.p2Dice5, self.p2Dice6]))
                            endTurn([self.p2Dice1, self.p2Dice2, self.p2Dice3, self.p2Dice4, self.p2Dice5, self.p2Dice6])
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
                            endTurn([self.p1Dice1, self.p1Dice2, self.p1Dice3, self.p1Dice4, self.p1Dice5, self.p1Dice6])
                            endTurn([self.p2Dice1, self.p2Dice2, self.p2Dice3, self.p2Dice4, self.p2Dice5, self.p2Dice6])
                            self.p1TmpScore = 0
                            self.p2TmpScore = 0
                            self.turn.toggle()
                            self.giveUpCounter = 0
                        } else {
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
