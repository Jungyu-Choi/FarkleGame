//
//  DiceArrayView.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/09.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import SwiftUI

struct DiceArrayView: View {
    
    @ObservedObject var player = Player()
    
    var body: some View {
        HStack {
            ForEach(player.dice) { dice in
                Button(action: {
                    dice.select.toggle()
                    print(dice.select)
                }) {
                    Image(dice.image())
                        .resizable()
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}
