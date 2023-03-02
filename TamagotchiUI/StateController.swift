//
//  StateController.swift
//  TamagotchiUI
//
//  Created by Leo Hammond on 24/02/2023.
//

import Foundation

class StateController: ObservableObject {
    @Published var tamagotchi: Tamagotchi
    
    init() {
        tamagotchi = Tamagotchi()
        
    }
    
    func loadFromFile() {
        if let loaded: Tamagotchi = FileManager.default.load(from: "tamagotchi.json") {
            tamagotchi = loaded
        }
    }
    
    func saveToFile() {
        FileManager.default.save(to: "tamagotchi.json", object: tamagotchi)
    }
}
