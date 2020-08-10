//
//  Dice.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/09.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import SwiftUI
import CoreLocation

class Dice: ObservableObject{
    var select: Bool = false {
        didSet {
            if self.imageName == "red\(numberOfDice)" {
                self.imageName = String(self.numberOfDice)
                print("unselect")
            } else {
                self.imageName = "red\(numberOfDice)"
                print("select")
            }
            print("imageName is now \(self.imageName)")
        }
    }
    @Published var scored: Bool = false {
        didSet {
            print("\(self.numberOfDice) was scored")
        }
    }
    @Published var numberOfDice: Int
    @Published var imageName: String
    
    init(num: Int) {
        self.numberOfDice = num
        self.imageName = String(num)
    }
    
    func reRollDice() {
        self.numberOfDice = Int.random(in: (1...6))
        self.imageName = String(self.numberOfDice)
    }
}
