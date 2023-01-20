//
//  Tamagotchi.swift
//  TamagotchiUI
//
//  Created by Hammond, Leo (NA) on 14/01/2023.
//

import Foundation

class Tamagotchi: ObservableObject {
    @Published private var hunger: Int
    @Published private var weight: Int
    @Published private var happiness: Int
    @Published private var health: Int
    @Published private var age: Int
    @Published private var needsBathroom: Bool
    @Published private var alive: Bool
    @Published public var name: String
    
    init() {
        self.hunger = 5
        self.weight = 5
        self.happiness = 5
        self.health = 10
        self.age = 0
        self.needsBathroom = false
        self.alive = true
        self.name = Names.names[Int.random(in: 0..<Names.names.count)]
    }
    
    func changeName() {
        self.name = Names.names[Int.random(in: 0..<Names.names.count)]
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
    
    func changeHunger(change: Int) {
        if self.hunger + change < 0 {
            self.hunger = 0
        }
        else if self.hunger + change > 10 {
            self.hunger = 10
        }
        else {
            self.hunger = self.hunger + change
        }
    }
        
       
    
    func changeWeight(change: Int) {
        if weight + change < 0 {
            self.weight = 0
        }
        else if weight + change > 10 {
            self.weight = 10
        }
        else {
            self.weight = weight + change
        }
    }
    
    func changeHappiness(change: Int) {
        if happiness+change < 0 {
            self.happiness = 0
        }
        else if happiness+change > 10 {
            self.happiness = 10
        }
        else {
            self.happiness = happiness+change
        }
    }
    
    func changeHealth(change: Int) {
        if health+change < 0 {
            self.health = 0
        }
        else if health+change > 10 {
            self.health = 10
        }
        else {
            self.health = health+change
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

