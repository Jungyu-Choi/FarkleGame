//
//  DiceArrayView.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/09.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import SwiftUI

struct DiceArrayView: View {

    @ObservedObject var dice1: Dice = Dice(num: Int.random(in: (1...6)))
    @ObservedObject var dice2: Dice = Dice(num: Int.random(in: (1...6)))
    @ObservedObject var dice3: Dice = Dice(num: Int.random(in: (1...6)))
    @ObservedObject var dice4: Dice = Dice(num: Int.random(in: (1...6)))
    @ObservedObject var dice5: Dice = Dice(num: Int.random(in: (1...6)))
    @ObservedObject var dice6: Dice = Dice(num: Int.random(in: (1...6)))
    
    var body: some View {
        HStack {
            if !self.dice1.scored {
                Button(action: {self.dice1.select.toggle()}) {
                    Image(self.dice1.imageName)
                    .resizable()
                    .frame(width: 50, height: 100)
                }
            }
            if !self.dice2.scored {
                Button(action: {self.dice2.select.toggle()}) {
                    Image(self.dice2.imageName)
                    .resizable()
                    .frame(width: 50, height: 100)
                }
            }
            if !self.dice3.scored {
                Button(action: {self.dice3.select.toggle()}) {
                    Image(self.dice3.imageName)
                    .resizable()
                    .frame(width: 50, height: 100)
                }
            }
            if !self.dice4.scored {
                Button(action: {self.dice4.select.toggle()}) {
                    Image(self.dice4.imageName)
                    .resizable()
                    .frame(width: 50, height: 100)
                }
            }
            if !self.dice5.scored {
                Button(action: {self.dice5.select.toggle()}) {
                    Image(self.dice5.imageName)
                    .resizable()
                    .frame(width: 50, height: 100)
                }
            }
            if !self.dice6.scored {
                Button(action: {self.dice6.select.toggle()}) {
                    Image(self.dice6.imageName)
                    .resizable()
                    .frame(width: 50, height: 100)
                }
            }
        }
    .buttonStyle(PlainButtonStyle())
    }
}
