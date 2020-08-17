//
//  Player.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/12.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import Foundation

class Player: ObservableObject {
    @Published var reloadView = false
    var diceArray = [Dice]()
    
    init() {
        diceArray.append(contentsOf: [
            Dice(num: Int.random(in: (1...6)), id: 1),
            Dice(num: Int.random(in: (1...6)), id: 2),
            Dice(num: Int.random(in: (1...6)), id: 3),
            Dice(num: Int.random(in: (1...6)), id: 4),
            Dice(num: Int.random(in: (1...6)), id: 5),
            Dice(num: Int.random(in: (1...6)), id: 6)
        ])
    }
}
