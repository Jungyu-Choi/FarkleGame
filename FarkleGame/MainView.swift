//
//  MainView.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/08.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import SwiftUI

class GameSettingClass : ObservableObject{
    var playerName: String = "Player"
    var settingValueOfMaxScore: Int = 0
}

struct MainView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.green.edgesIgnoringSafeArea(.all)
                VStack (spacing: 10){
                    Text("Farkle")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding(.bottom, 200.0)

                    NavigationLink(destination: PlayGameView()) {
                        Text("Play Game")
                    }
                    NavigationLink(destination: SettingView()) {
                        Text("Setting")
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static let preview = GameSettingClass()
    
    static var previews: some View {
        MainView().environmentObject(preview)
    }
}
