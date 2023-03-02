//
//  TamagotchiUITests.swift
//  TamagotchiUITests
//
//  Created by Hammond, Leo (NA) on 14/01/2023.
//

import XCTest
@testable import TamagotchiUI

class TamagotchiUITests: XCTestCase {

    func testChangeHealthChangesHealthByCorrectAmount() {
        //arrange
        let tamagotchi = Tamagotchi()
        let change = -1
        let expected = tamagotchi.getHealth() + change
        //act
        tamagotchi.changeHealth(change: change)
        let actual = tamagotchi.getHealth()
        //assert
        XCTAssertEqual(actual, expected)
    }
    
    func testChangeHungerChangesHungerByCorrectAmount() {
        //arrange
        let tamagotchi = Tamagotchi()
        let change = -1
        let expected = tamagotchi.getHunger() + change
        //act
        tamagotchi.changeHunger(change: change)
        let actual = tamagotchi.getHunger()
        //assert
        XCTAssertEqual(actual, expected)
    }
    
    func testChangeWeightChangesWeightByCorrectAmount() {
        //arrange
        let tamagotchi = Tamagotchi()
        let change = -1
        let expected = tamagotchi.getWeight() + change
        //act
        tamagotchi.changeWeight(change: change)
        let actual = tamagotchi.getWeight()
        //assert
        XCTAssertEqual(actual, expected)
    }
    
    func testChangeHappinessChangesHappinessByCorrectAmount() {
        //arrange
        let tamagotchi = Tamagotchi()
        let change = -1
        let expected = tamagotchi.getHappiness() + change
        //act
        tamagotchi.changeHappiness(change: change)
        let actual = tamagotchi.getHappiness()
        //assert
        XCTAssertEqual(actual, expected)
    }
    
    func testCheckIfDeadChecksIfDead() {
        //arrange
        let tamagotchi = Tamagotchi()
        //act
        tamagotchi.changeHealth(change: -10)
        tamagotchi.checkIfDead()
        let actual = tamagotchi.getAlive()
        let expected = false
        //assert
        XCTAssertEqual(actual, expected)
    }
}
