//
//  Player.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/09.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import SwiftUI

class Player: ObservableObject {
    var playerScore: Int
    var dice : [Dice]
    @ObservedObject var dice1: Dice = Dice(id: 1, imageName: String(arc4random_uniform(6)+1))
    @ObservedObject var dice2: Dice = Dice(id: 2, imageName: String(arc4random_uniform(6)+1))
    @ObservedObject var dice3: Dice = Dice(id: 3, imageName: String(arc4random_uniform(6)+1))
    @ObservedObject var dice4: Dice = Dice(id: 4, imageName: String(arc4random_uniform(6)+1))
    @ObservedObject var dice5: Dice = Dice(id: 5, imageName: String(arc4random_uniform(6)+1))
    @ObservedObject var dice6: Dice = Dice(id: 6, imageName: String(arc4random_uniform(6)+1))
    
    init() {
        self.playerScore = 0
        self.dice = []
        self.dice.append(dice1)
        self.dice.append(dice2)
        self.dice.append(dice3)
        self.dice.append(dice4)
        self.dice.append(dice5)
        self.dice.append(dice6)
    }
    
    func initDice() {
        self.dice.removeAll()
        for id in 1...6 {
            self.dice.append(Dice(id: id, imageName: String(arc4random_uniform(6)+1)))
        }
    }
}
