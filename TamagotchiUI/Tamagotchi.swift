//
//  Tamagotchi.swift
//  TamagotchiUI
//
//  Created by Hammond, Leo (NA) on 14/01/2023.
//

import Foundation

class Tamagotchi {
    private var hunger: Int
    private var weight: Int
    private var happiness: Int
    private var health: Int
    private var age: Int
    private var needsBathroom: Bool
    private var alive: Bool
    private let name: String
    
    init(name: String) {
        self.hunger = 5
        self.weight = 5
        self.happiness = 5
        self.health = 10
        self.age = 0
        self.needsBathroom = false
        self.alive = true
        self.name = name
    }
    
    func getHunger() -> Int{
        return self.hunger
    }
    
    func getWeight() -> Int{
        return self.weight
    }
    
    func getHappiness() -> Int{
        return self.happiness
    }
    
    func getHealth() -> Int{
        return self.health
    }
    
    func getAge() -> Int{
        return self.age
    }
    
    func getNeedsBathroom() -> Bool {
        return self.needsBathroom
    }
    
    func getAlive() -> Bool {
        return self.alive
    }
    
    func changeHunger(newHunger: Int) {
        if newHunger < 0 {
            self.hunger = 0
        }
        else if newHunger > 10 {
            self.hunger = 10
        }
        else {
            self.hunger = newHunger
        }
    }
    
    func changeWeight(newWeight: Int) {
        if newWeight < 0 {
            self.weight = 0
        }
        else if newWeight > 10 {
            self.weight = 10
        }
        else {
            self.weight = newWeight
        }
    }
    
    func changeHappiness(newHappiness: Int) {
        if newHappiness < 0 {
            self.happiness = 0
        }
        else if newHappiness > 10 {
            self.happiness = 10
        }
        else {
            self.happiness = newHappiness
        }
    }
    
    func changeHealth(newHealth: Int) {
        if newHealth < 0 {
            self.health = 0
        }
        else if newHealth > 10 {
            self.health = 10
        }
        else {
            self.health = newHealth
        }
    }
    
    func addAge() {
        self.age += 1
    }
    
    func needsToPoo() {
        self.needsBathroom = true
    }
    
    func usesBathroom() {
        self.needsBathroom = false
    }
    
    func dies() {
        self.alive = false
    }
    
    public func displayStats()  -> String {
        return """
    Hunger: \(hunger)
    Weight: \(weight)
    Happiness: \(happiness)
    Health: \(health)
    Age: \(age)
    NeedsBathroom: \(needsBathroom)
    Alive: \(alive)
    Name: \(name)
"""
    }
    

}

