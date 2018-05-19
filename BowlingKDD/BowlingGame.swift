//
//  Game.swift
//  BowlingKDD
//
//  Created by ruijia lin on 5/19/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

import Foundation

class BowlingGame {
    
    private var rolls = [Int](repeating: 0, count: 21)
    private var currentRoll = 0
    
    func roll(pin: Int) {
        rolls[currentRoll] = pin
        currentRoll += 1
    }
    
    func score() -> Int {
        var score = 0
        var roll = 0
        
        for _ in stride(from: 0, to: 10, by: 1){
            // strike
            if isStrike(roll){
                score += strikeScore(roll)
                roll += 1
            }
            // spare
            else if isSpare(roll) {
                score += spareScore(roll)
                roll += 2
            }else{
                score += regularScore(roll)
                roll += 2
            }
        }
        return score
    }
    
    private func isSpare(_ roll: Int) -> Bool{
        return rolls[roll] + rolls[roll + 1] == 10
    }
    
    private func isStrike(_ roll: Int) -> Bool{
        return rolls[roll] == 10
    }
    
    private func strikeScore(_ roll: Int) -> Int {
        return 10 + rolls[roll + 1] + rolls[roll + 2]
    }
    
    private func spareScore(_ roll: Int) -> Int {
        return 10 + rolls[roll + 2]
    }
    
    private func regularScore(_ roll: Int) -> Int {
        return rolls[roll] + rolls[roll + 1]
    }
    
}
