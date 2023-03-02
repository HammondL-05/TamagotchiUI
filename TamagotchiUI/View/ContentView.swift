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
    @State var image = TamagotchiImage.images[0]
    @EnvironmentObject var state: StateController
    var body: some View {
        
        Form {
            Section {
                GeometryReader { geo in
                    Image(image)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .frame(width: geo.size.width * 0.8)
                        .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            VStack(alignment: .leading,
                   spacing: 10) {
                Text(tamagotchi.displayStats())
            }
            Section {
                Button("Change Name", action: {
                    tamagotchi.changeName()
//                    state.saveToFile()
                }).disabled(isDead)
                
                Button("Change Tamagotchi", action :{
                    image = tamagotchi.changeImage()
//                    state.saveToFile()
                }).disabled(isDead)
                
                Button("Feed \(tamagotchi.name)", action: {
                    tamagotchi.changeHunger(change: +1)
                    tamagotchi.changeWeight(change: +1)
//                    state.saveToFile()
                }).foregroundColor(buttonColour).disabled(feedingDisabled).disabled(isDead)
                
                Button("Exercise", action: {
                    tamagotchi.changeHappiness(change: 1)
                    tamagotchi.changeHealth(change: 1)
                    tamagotchi.changeWeight(change: -1)
                    tamagotchi.changeHunger(change: -1)
//                    state.saveToFile()
                }).disabled(isDead)
                
                Button("Play", action: {
                    tamagotchi.changeHappiness(change: 1)
//                    state.saveToFile()
                }).disabled(isDead)
                
                Button("Clean Up", action: {
                    tamagotchi.cleanUp()
//                    state.saveToFile()
                }).disabled(isDead)

            }
        }.onAppear {
            tamagotchi.startAging()
            tamagotchi.beginsToPoo()
        }//.onAppear(perform: state.loadFromFile())
    }
    var isDead: Bool {
        if tamagotchi.getAlive() == false {
            return true
        } else {
            return false
        }
    }
  
    

    
    var buttonColour: Color {
        if tamagotchi.getHunger() == 10 || tamagotchi.getWeight() == 10 || tamagotchi.getAlive() == false {
            return .red
        }
        else {
            return .green
        }
    }
    var feedingDisabled: Bool {
        if tamagotchi.getHunger() == 10 || tamagotchi.getWeight() == 10 {
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
            .environmentObject(StateController())
    }
}
