//
//  PlayGameView.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/08.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import SwiftUI

struct PlayGameView: View {
    @EnvironmentObject var gameSetting: GameSettingClass
    @State var playerScore: Int = 0
    @State var comScore: Int = 0
    
    var body: some View {
        
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            VStack (spacing: 10){
                HStack {
                    Text("Hello \(gameSetting.playerName)")
                    Text("maxScore is \(gameSetting.settingValueOfMaxScore * 2000 + 2000)")
                }
                Spacer()
                HStack{
                    DiceArrayView()
                    .frame(width: 350, height: 250)
                    .scaledToFit()
                }

                Spacer()
                HStack {
                    Button(action: {print("debug")}) {
                        Text("DEBUG")
                    }
                }
                Divider()
                HStack {
                    Image(systemName: "repeat")
                        .resizable()
                    Image(systemName: "checkmark")
                        .resizable()
                    Image(systemName: "xmark")
                        .resizable()
                }
                .frame(width: 300, height: 100)
            }
        }
        
    .navigationBarBackButtonHidden(true)
    }
}

struct PlayGameView_Previews: PreviewProvider {
    static let preview = GameSettingClass()
    
    static var previews: some View {
        PlayGameView().environmentObject(preview)
    }
}
