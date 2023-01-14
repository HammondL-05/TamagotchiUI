//
//  ContentView.swift
//  TamagotchiUI
//
//  Created by Hammond, Leo (NA) on 14/01/2023.
//

import SwiftUI



struct ContentView: View {
    let tamagotchiNames = Names()
    var selectedName: Int = 0
    let tamagotchi = Tamagotchi(name: tamagotchiNames.names[selectedName])
    
    
    
    
    var body: some View {
        Form {
            VStack {
                Text(tamagotchi.displayStats())
            }
            Section {
                Button("Change Name", action: {
                    
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
