//
//  ScoreCalculation.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/10.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import Foundation

func calcScore(_ arr: [Int]) -> Int?{

    // MARK: - Calculating duplicated dice
    switch arr.count {
    case 1:
        if arr.contains(1){
            return 100
        }
        else if arr.contains(5){
            return 50
        }
        else{
            return nil
        }
    case 2:
        if arr.contains(1){
            return 200
        }
        else if arr.contains(5){
            return 100
        }
        else{
            return nil
        }
    case 3:
        if arr.contains(1){
            return 1000
        }
        else{
            return arr[0] * 100
        }
    case 4:
        if arr.contains(1){
            return 2000
        }
        else{
            return arr[0] * 200
        }
    case 5:
        if arr.contains(1){
            return 4000
        }
        else{
            return arr[0] * 400
        }
    default:
        return nil
    }
}
