//
//  ContentView.swift
//  TamagotchiUI
//
//  Created by Hammond, Leo (NA) on 14/01/2023.
//

import SwiftUI



struct ContentView: View {
    let tamagotchiNames = Names()
    @StateObject var tamagotchi = Tamagotchi()
    
    var body: some View {
        
        Form {
            VStack(alignment: .leading,
                   spacing: 10) {
                Text(tamagotchi.displayStats())
            }
            Section {
                Button("Change Name", action: {
                    tamagotchi.changeName()
                })
                
                Button("Feed \(tamagotchi.name)", action: {
                    tamagotchi.changeHunger(change: +1)
                    tamagotchi.changeWeight(change: +1)
                }).foregroundColor(buttonColour).disabled(feedingDisabled)
                
                Button("Excersise", action: {
                    tamagotchi.changeHappiness(change: 1)
                    tamagotchi.changeHealth(change: 1)
                    tamagotchi.changeWeight(change: -1)
                    tamagotchi.changeHunger(change: -1)
                })
                
                Button("Play", action: {
                    tamagotchi.changeHappiness(change: 1)
                })
                
//                Button("Change Name", action: {
//                    tamagotchi.changeName()
//                })

            }
        }
    }
    var buttonColour: Color {
        if tamagotchi.getHunger() == 10 || tamagotchi.getWeight() == 10 {
            return .red
        }
        else {
            return .green
        }
    }
    var feedingDisabled: Bool {
        if tamagotchi.getHunger() == 10 || tamagotchi.getHunger() == 0 {
            return true
        }
        else {
            return false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
