//
//  Dice.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/09.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import Foundation

class Dice: Identifiable {
    let id: Int
    var select = false {
        didSet {
            if self.imageName == "red\(numberOfDice)" {
                self.imageName = String(self.numberOfDice)
            } else {
                self.imageName = "red\(numberOfDice)"
            }
            
        }
    }
    var scored = false
    var numberOfDice: Int
    var imageName: String
    
    init(num: Int, id: Int) {
        self.id = id
        self.numberOfDice = num
        self.imageName = String(num)
    }
    
    func reRollDice() {
        self.numberOfDice = Int.random(in: (1...6))
        self.imageName = String(self.numberOfDice)
    }
}
