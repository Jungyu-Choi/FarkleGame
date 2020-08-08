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
    
    var body: some View {
        
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            VStack (spacing: 10){
                Text("Hello \(gameSetting.playerName)")
                Text("maxScore is \(gameSetting.settingValueOfMaxScore * 2000 + 2000)")
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
