//
//  GameSetting.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/10.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import SwiftUI

class GameSetting : ObservableObject{
    @Published var playerName: String = "Player"
    @Published var settingValueOfMaxScore: Int = 0
    @Published var gameOverP1Score: Int = 0
    @Published var gameOverP2Score: Int = 0
}
