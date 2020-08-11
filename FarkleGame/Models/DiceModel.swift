//
//  DiceModel.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/11.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import Foundation

var isScorable: Bool = false

func insertSortedDice(_ d: [Dice]) -> [Dice] {
    var array: [Dice] = []
    
    for dice in d {
        if dice.select {
            array.append(dice)
        }
    }
    if array.count < 2 {
        return array
    } else {
        for _ in 1...array.count {
            for index in 0...array.count-2 {
                var tmpDice: Dice
                if array[index].numberOfDice > array[index+1].numberOfDice {
                    tmpDice = array[index]
                    array[index] = array[index+1]
                    array[index+1] = tmpDice
                }
            }
        }
    }
    return array
}

func invisibleScoredDice(_ d: [Dice]) {
    for dice in d {
        if dice.select {
            dice.select = false
            dice.scored = true
        } else {
            dice.reRollDice()
        }
    }
    isScorable = false
}

func checkHotDice(_ d: [Dice]) {
    if d[0].scored, d[1].scored, d[2].scored, d[3].scored, d[4].scored, d[5].scored {
        print("HOT DICE")
        for dice in d {
            dice.scored = false
            dice.select = false
            dice.reRollDice()
        }
    }
}

func endTurn(_ d: [Dice]) {
    for dice in d {
        dice.scored = false
        dice.select = false
        dice.reRollDice()
    }
}

func checkScorable(_ sortedArray: [Dice]) -> Int {
    var tmpArray: [Int] = []
    
    for dice in sortedArray {
        if dice.select {
            tmpArray.append(dice.numberOfDice)
        }
    }
    
    if tmpArray.count == 0 {
        return -1
    }
    
    if tmpArray.count == 5 {
        if tmpArray.contains(1), tmpArray.contains(2), tmpArray.contains(3), tmpArray.contains(4), tmpArray.contains(5) {
            return 500
        } else if tmpArray.contains(2), tmpArray.contains(3), tmpArray.contains(4), tmpArray.contains(5), tmpArray.contains(6) {
            return 750
        }
        
    } else if tmpArray.count == 6 {
        if tmpArray.contains(1), tmpArray.contains(2), tmpArray.contains(3), tmpArray.contains(4), tmpArray.contains(5), tmpArray.contains(6) {
            return 1500
        } else if tmpArray.contains(1), tmpArray.contains(2), tmpArray.contains(3), tmpArray.contains(4), tmpArray.contains(5) {
            var dupDice = 0
            for index in 0...5 {
                if tmpArray[index] == tmpArray[index + 1] {
                    dupDice = tmpArray[index]
                    break
                }
            }
            switch dupDice {
            case 1:
                return 600
            case 5:
                return 550
            default:
                return -1
            }
        } else if tmpArray.contains(2), tmpArray.contains(3), tmpArray.contains(4), tmpArray.contains(5), tmpArray.contains(6) {
            var dupDice = 0
            for index in 0...5 {
                if tmpArray[index] == tmpArray[index + 1] {
                    dupDice = tmpArray[index]
                    break
                }
            }
            switch dupDice {
            case 5:
                return 800
            default:
                return -1
            }
        }
    } else if tmpArray.count == 1 {
        if tmpArray.contains(1) {
            return 100
        } else if tmpArray.contains(5) {
            return 50
        }
    }
    var score: Int = 0
    var stack: Int = 0
    var stackDiceArray: [Int] = []
    
    for index in 0...tmpArray.count-2 {
        stackDiceArray.append(tmpArray[index])
        
        if stackDiceArray[stack] == tmpArray[index + 1] {
            stack += 1
            
            if index == tmpArray.count-2 {
                stackDiceArray.append(tmpArray[index + 1])
                
                if calcScore(stackDiceArray) == -1 {
                    return -1
                }
                
                score += calcScore(stackDiceArray)
                stackDiceArray.removeAll()
                stack = 0
            }
        } else {
            if calcScore(stackDiceArray) == -1 {
                return -1
            }
            
            score += calcScore(stackDiceArray)
            stackDiceArray.removeAll()
            
            if index == tmpArray.count-2 {
                stackDiceArray.append(tmpArray[index + 1])
                
                if calcScore(stackDiceArray) == -1 {
                    return -1
                }
                
                score += calcScore(stackDiceArray)
                stackDiceArray.removeAll()
            }
            stack = 0
        }
    }
    return score
}
