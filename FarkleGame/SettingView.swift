//
//  SettingView.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/08.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject var gameSetting: GameSetting
    let maxScores = ["2000", "4000", "6000", "8000", "10000"]
    @State var currentMaxScore: Int = 0
    
    var body: some View {
        Form {
            Section(header: Text("Player Name")) {
                TextField(gameSetting.playerName, text: $gameSetting.playerName)
            }
            Section(header: Text("Max Score")) {
                Picker("Change Max Score", selection: $gameSetting.settingValueOfMaxScore) {
                    ForEach(0..<self.maxScores.count) {
                        Text(self.maxScores[$0])
                    }
                }
            }
            Section(header: Text("Select opponent")) {
                Toggle(isOn: $gameSetting.vsComputer) {
                    Text("Vs. COM")
                }
            }
            Text("v1.1")
        }
        .navigationBarTitle("Setting")
    }
}

struct SettingView_Previews: PreviewProvider {
    static let preview = GameSetting()
    static var previews: some View {
        SettingView().environmentObject(preview)
    }
}
