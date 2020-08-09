//
//  Dice.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/09.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import SwiftUI
import CoreLocation

class Dice: Identifiable, ObservableObject{
    var id: Int
    @Published var select: Bool = false {
        didSet {
            print(select)
        }
    }
    var imageName: String
    
    func image() -> String {
        if self.select {
            return "red\(imageName)"
        } else {
            return imageName
        }
    }
    init(id: Int, imageName: String) {
        self.id = id
        self.imageName = imageName
    }
    
    func setDice(number: Int) {
        self.imageName = String(number)
    }
}
