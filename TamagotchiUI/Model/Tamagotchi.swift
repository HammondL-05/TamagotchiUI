//
//  Tamagotchi.swift
//  TamagotchiUI
//
//  Created by Hammond, Leo (NA) on 14/01/2023.
//

import Foundation

class Tamagotchi: ObservableObject, Codable {
    @Published private var hunger: Int
    @Published private var weight: Int
    @Published private var happiness: Int
    @Published private var health: Int
    @Published private var age: Int
    @Published private var poos: Int
    @Published private var alive: Bool
    @Published public var name: String
    @Published public var picture: String
    @Published private var timer: Timer?
    private var interval: Double = 0.0
    
    init() {
        self.hunger = 5
        self.weight = 5
        self.happiness = 5
        self.health = 10
        self.age = 0
        self.poos = 0
        self.alive = true
        self.name = Names.names[Int.random(in: 0..<Names.names.count)]
        self.picture = TamagotchiImage.images[Int.random(in: 0..<TamagotchiImage.images.count)]
    }
    
    func changeName() {
        self.name = Names.names[Int.random(in: 0..<Names.names.count)]
    }
    
    func changeImage() -> String {
        return TamagotchiImage.images[Int.random(in: 0..<TamagotchiImage.images.count)]
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
    
    func getPoos() -> Int {
        return self.poos
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
    
    func beginsToPoo() {
        interval = TimeInterval.random(in: 250...600)
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            if self.health > 1 && self.happiness > 0 {
                self.interval = TimeInterval.random(in: 250...600)
                self.poos += 1
                self.happiness -= 1
                self.health -= 2
                self.checkIfDead()
            } else if self.health == 1 && self.happiness > 0 {
                self.interval = TimeInterval.random(in: 250...600)
                self.poos += 1
                self.happiness -= 1
                self.health -= 1
                self.checkIfDead()
            } else if self.health > 1 && self.happiness == 0 {
                self.interval = TimeInterval.random(in: 250...600)
                self.poos += 1
                self.health -= 1
                self.checkIfDead()
            } else if self.health == 1 && self.happiness == 0 {
                self.interval = TimeInterval.random(in: 250...600)
                self.poos += 1
                self.health -= 1
                self.checkIfDead()
            } else {
                self.interval = TimeInterval.random(in: 250...600)
                self.checkIfDead()
            }
        }
    }
    
    func cleanUp() {
        if self.poos != 0 && self.happiness != 10{
            self.poos -= 1
            self.happiness += 1
        } else if self.poos != 0 && self.happiness == 10 {
            self.poos -= 1
        }
    }
    
    func checkIfDead() {
        if self.health <= 0 {
            self.alive = false
            self.stopAging()
        }
    }
    
    public func displayStats()  -> String {
        return """
    Hunger: \(hunger)
    Weight: \(weight)
    Happiness: \(happiness)
    Health: \(health)
    Age: \(age)
    Poos: \(poos)
    Alive: \(alive)
    Name: \(name)
"""
    }
    func stopAging() {
        timer?.invalidate()
        timer = nil
    }
    
    func startAging() {
        timer = Timer.scheduledTimer(withTimeInterval: 300, repeats: true) { timer in
            self.age += 1
            if self.age >= 60 {
                self.alive = false
                self.stopAging()
            }
        }
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        hunger = try container.decode(Int.self, forKey: .hunger)
        weight = try container.decode(Int.self, forKey: .weight)
        happiness = try container.decode(Int.self, forKey: .happiness)
        health = try container.decode(Int.self, forKey: .health)
        age = try container.decode(Int.self, forKey: .age)
        poos = try container.decode(Int.self, forKey: .poos)
        alive = try container.decode(Bool.self, forKey: .alive)
        name = try container.decode(String.self, forKey: .name)
        picture = try container.decode(String.self, forKey: .picture)
        
    }
    
    private enum CodingKeys: CodingKey {
        case hunger, weight, happiness, health, age, poos, alive, name, picture
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(hunger, forKey: .hunger)
        try container.encode(weight, forKey: .weight)
        try container.encode(happiness, forKey: .happiness)
        try container.encode(health, forKey: .health)
        try container.encode(age, forKey: .age)
        try container.encode(poos, forKey: .poos)
        try container.encode(alive, forKey: .alive)
        try container.encode(name, forKey: .name)
        try container.encode(picture, forKey: .picture)
        
    }
    

}

