//
//  GameSetting.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/10.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import SwiftUI

class GameSetting : ObservableObject{
    @Published var playerName = "Player 1"
    @Published var settingValueOfMaxScore = 0
    @Published var gameOverP1Score = 0
    @Published var gameOverP2Score = 0
    @Published var gameOver = false
}
