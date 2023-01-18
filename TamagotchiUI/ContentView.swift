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
                    //change name
                })
                Button("Feed \(tamagotchiNames.names[selectedName])", action: {
                    tamagotchi.changeHunger(change: -1)
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
