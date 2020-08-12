//
//  Player.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/12.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import Foundation

class Player: ObservableObject {
    @Published var diceArray = [Dice]()
    @Published var reloadView = false
    
    @Published var dice1: Dice = Dice(num: Int.random(in: (1...6)), id: 1)
    @Published var dice2: Dice = Dice(num: Int.random(in: (1...6)), id: 2)
    @Published var dice3: Dice = Dice(num: Int.random(in: (1...6)), id: 3)
    @Published var dice4: Dice = Dice(num: Int.random(in: (1...6)), id: 4)
    @Published var dice5: Dice = Dice(num: Int.random(in: (1...6)), id: 5)
    @Published var dice6: Dice = Dice(num: Int.random(in: (1...6)), id: 6)
    
    init() {
        objectWillChange.send()
        diceArray.append(contentsOf: [dice1, dice2, dice3, dice4, dice5, dice6])
    }
}
