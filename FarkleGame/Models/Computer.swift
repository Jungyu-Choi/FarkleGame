//
//  Computer.swift
//  FarkleGame
//
//  Created by Jungyu Choi on 2020/08/17.
//  Copyright © 2020 Jungyu Choi. All rights reserved.
//

import Foundation

extension Player {
    func computerTurn(_ playerScore: Int, _ comScore: Int, _ d: [Dice]) {
        let notScoredArray = d.filter{ !$0.scored }
        let highestInfo = calculateAllOfDiceScore(notScoredArray)
        let amountOfDice1InArray = notScoredArray.filter{ $0.numberOfDice == 1 }.count
        let amountOfDice5InArray = notScoredArray.filter{ $0.numberOfDice == 5 }.count
        let riskyPlayType = playerScore - comScore > 500
        print("score : \(score)")
        print("tmpScore : \(tmpScore)")
        //0. Scorable Dice didn't existed
        if highestInfo.score == 0 {
            // SCORE : 0 / SKIP TURN
            tmpScore = 0
            print("return0")
            return
        }
        //1. Checking Hot Dice
        if notScoredArray.count == highestInfo.index.count {
            print("//1")
            // HOTDICE
            for index in highestInfo.index {
                diceArray[index].select = true
            }
            if let calc = checkScorable(diceArray) {
                tmpScore += calc
                invisibleScoredDice(diceArray)
                checkHotDice(diceArray)
                computerTurn(playerScore, comScore, diceArray)
            }
        }
        //2. Only have 1 or 5 of dice
        if highestInfo.score <= 300 {
            var lowDice: Int
            if amountOfDice1InArray > 0 {
                lowDice = 1
            } else {
                lowDice = 5
            }
            print("//2")
            print("riskyPlayType : \(riskyPlayType)")
            if riskyPlayType {
                // reroll
                for index in highestInfo.index {
                    diceArray[index].select = true
                }
                if let calc = checkScorable(diceArray) {
                    tmpScore += calc
                    invisibleScoredDice(diceArray)
                    computerTurn(playerScore, comScore, diceArray)
                }

            } else {
                if notScoredArray.count - highestInfo.index.count < 3 {
                    // score 1 dice reroll or score highscore endturn
                    if Bool.random() {
                        for index in highestInfo.index {
                            diceArray[index].select = true
                        }
                        if let calc = checkScorable(diceArray) {
                            score += tmpScore + calc
                            invisibleScoredDice(diceArray)
                            print("return1")
                            return
                        }
                    } else {
                        
                        for index in highestInfo.index {
                            if diceArray[index].numberOfDice == lowDice && !diceArray[index].scored {
                                diceArray[index].select = true
                                break
                            }
                        }
                        if let calc = checkScorable(diceArray) {
                            tmpScore += calc
                            invisibleScoredDice(diceArray)
                            computerTurn(playerScore, comScore, diceArray)
                        }
                    }
                } else {
                    for index in highestInfo.index {
                        if diceArray[index].numberOfDice == lowDice && !diceArray[index].scored {
                            diceArray[index].select = true
                            break
                        }
                    }
                    if let calc = checkScorable(diceArray) {
                        tmpScore += calc
                        invisibleScoredDice(diceArray)
                        computerTurn(playerScore, comScore, diceArray)
                    }
                }
            }
        } else {
        //3. score highestScore
            if highestInfo.score >= 1000 && highestInfo.index.count == 3 {
                print("//3")
                // score highestscore & reroll
                for index in highestInfo.index {
                    diceArray[index].select = true
                }
                if let calc = checkScorable(diceArray) {
                    tmpScore += calc
                    invisibleScoredDice(diceArray)
                    computerTurn(playerScore, comScore, diceArray)
                }
            }
            if riskyPlayType {
                // reroll
                for index in highestInfo.index {
                    diceArray[index].select = true
                }
                if let calc = checkScorable(diceArray) {
                    tmpScore += calc
                    invisibleScoredDice(diceArray)
                    computerTurn(playerScore, comScore, diceArray)
                }

            } else {
                // TODO: - random reroll or endturn
                if Bool.random() {
                    for index in highestInfo.index {
                        diceArray[index].select = true
                    }
                    if let calc = checkScorable(diceArray) {
                        score += tmpScore + calc
                        invisibleScoredDice(diceArray)
                        print("return2")
                        return
                    }
                } else {
                    for index in highestInfo.index {
                        diceArray[index].select = true
                    }
                    if let calc = checkScorable(diceArray) {
                        tmpScore += calc
                        invisibleScoredDice(diceArray)
                        computerTurn(playerScore, comScore, diceArray)
                    }
                }
            }
        }
    }
    
    func calculateAllOfDiceScore(_ diceArray: [Dice]) -> (score: Int, index: [Int]) {
        var highestScorableDiceIndex = [Int]() {
            didSet {
                print("highestScorableDiceIndex : \(highestScorableDiceIndex)")
            }
        }
        var highestScore = 0 {
            didSet {
                print("highestScore : \(highestScore)")
            }
        }
        
        for dice in diceArray {
            dice.select = true
        }
        
        // MARK: - 1 of Dice
        for index in 0...diceArray.count-1 {
            if let tmpScore = checkScorable([diceArray[index]]) {
                if highestScore < tmpScore {
                    highestScore = tmpScore
                    highestScorableDiceIndex.removeAll()
                    highestScorableDiceIndex.append(index)
                }
            }
        }
        // MARK: - 2 of Dice
        for i in 0...diceArray.count-1 {
            for j in 0...diceArray.count-1 {
                if i >= j {
                    continue
                } else {
                    if let tmpScore = checkScorable([diceArray[i], diceArray[j]]) {
                        if highestScore < tmpScore {
                            highestScore = tmpScore
                            highestScorableDiceIndex.removeAll()
                            highestScorableDiceIndex.append(contentsOf: [i, j])
                        }
                    }
                }
            }
        }
        // MARK: - 3 of Dice
        for i in 0...diceArray.count-1 {
            for j in 0...diceArray.count-1 {
                for k in 0...diceArray.count-1 {
                    if i >= j || j >= k {
                        continue
                    } else {
                        if let tmpScore = checkScorable([diceArray[i], diceArray[j], diceArray[k]]) {
                            if highestScore < tmpScore {
                                highestScore = tmpScore
                                highestScorableDiceIndex.removeAll()
                                highestScorableDiceIndex.append(contentsOf: [i, j, k])
                            }
                        }
                    }
                }
            }
        }
        // MARK: - 4 of Dice
        for i in 0...diceArray.count-1 {
            for j in 0...diceArray.count-1 {
                for k in 0...diceArray.count-1 {
                    for l in 0...diceArray.count-1 {
                        if i >= j || j >= k || k >= l {
                            continue
                        } else {
                            if let tmpScore = checkScorable([diceArray[i], diceArray[j], diceArray[k], diceArray[l]]) {
                                if highestScore < tmpScore {
                                    highestScore = tmpScore
                                    highestScorableDiceIndex.removeAll()
                                    highestScorableDiceIndex.append(contentsOf: [i, j, k, l])
                                }
                            }
                        }
                    }
                }
            }
        }
        // MARK: - 5 of Dice
        for i in 0...diceArray.count-1 {
            for j in 0...diceArray.count-1 {
                for k in 0...diceArray.count-1 {
                    for l in 0...diceArray.count-1 {
                        for m in 0...diceArray.count-1 {
                            if i >= j || j >= k || k >= l || l >= m {
                                continue
                            } else {
                                if let tmpScore = checkScorable([diceArray[i], diceArray[j], diceArray[k], diceArray[l], diceArray[m]]) {
                                    if highestScore < tmpScore {
                                        highestScore = tmpScore
                                        highestScorableDiceIndex.removeAll()
                                        highestScorableDiceIndex.append(contentsOf: [i, j, k, l, m])
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        // MARK: - 6 of Dice
        if diceArray[0].numberOfDice == 1 &&
            diceArray[1].numberOfDice == 2 &&
            diceArray[2].numberOfDice == 3 &&
            diceArray[3].numberOfDice == 4 &&
            diceArray[4].numberOfDice == 5 &&
            diceArray[5].numberOfDice == 6 {
            highestScore = 1500
            highestScorableDiceIndex.removeAll()
            highestScorableDiceIndex.append(contentsOf: [1, 2, 3, 4, 5, 6])
        }
        
        
        print("highestScorableDiceIndex : \(highestScorableDiceIndex)")
        print("highestScore : \(highestScore)")
        
        for dice in diceArray {
            dice.select = false
        }
        
        return (score: highestScore, index: highestScorableDiceIndex)
    }

}
