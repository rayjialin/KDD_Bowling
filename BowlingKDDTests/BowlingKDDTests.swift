//
//  BowlingKDDTests.swift
//  BowlingKDDTests
//
//  Created by ruijia lin on 5/19/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

import XCTest
@testable import BowlingKDD

class BowlingKDDTests: XCTestCase {
    
    var game: BowlingGame!
    
    override func setUp() {
        super.setUp()
        game = BowlingGame()
    }
    
    override func tearDown() {
        game = nil
        super.tearDown()
    }
    
    func testGutterGame(){
        
        rollMany(pins: 0, times: 20)
        
        XCTAssertEqual(game.score(), 0)
    }
    
    func testAllOne(){
        rollMany(pins: 1, times: 20)
        
        XCTAssertEqual(game.score(), 20)
    }
    
    func testOneSpare(){
        rollSpare()
        game.roll(pin: 9)
        rollMany(pins: 0, times: 17)
        
        XCTAssertEqual(game.score(), 28)
    }
    
    func testOneStrike(){
        rollStrike()
        game.roll(pin: 5)
        game.roll(pin: 4)
        
        rollMany(pins: 0, times: 16)
        
        XCTAssertEqual(game.score(), 28)
    }
    
    func testPerfectGame(){
        rollMany(pins: 10, times: 12)
        
        XCTAssertEqual(game.score(), 300)
    }
    
    func testScore100(){
        rollStrike()
        rollStrike()
        rollStrike()
        game.roll(pin: 5)
        game.roll(pin: 1)
        rollMany(pins: 0, times: 12)
        
        XCTAssertEqual(game.score(), 77)
    }
    
    
    func rollMany(pins: Int, times: Int){
        for _ in 1...times{
            game.roll(pin: pins)
        }
    }
    
    private func rollSpare(){
        game.roll(pin: 5)
        game.roll(pin: 5)
    }
    
    private func rollStrike(){
        game.roll(pin: 10)
    }
}
