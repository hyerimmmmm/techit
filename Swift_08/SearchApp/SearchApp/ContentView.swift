//
//  ContentView.swift
//  SearchApp
//
//  Created by 김혜림 on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    
    let petArray = ["Cat", "Dog", "Fish", "Donkey", "Canary", "Camel", "Frog", "Cat", "Dog", "Fish", "Donkey", "Canary", "Camel", "Frog", "Cat", "Dog", "Fish", "Donkey", "Canary", "Camel", "Frog"]
    
    var body: some View {
        NavigationStack {
            PetListView(animals: petArray)
                .navigationTitle("SearchApp")
        }
        .navigationBarTitleDisplayMode(.automatic)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Look for a pet") {
            Text("Singing").searchCompletion("Canary")
            Text("Croaking").searchCompletion("Frog")
            Text("Grumpy").searchCompletion("Cat")
            
            Divider()
            
            ForEach(petArray.filter { $0.hasPrefix(searchText) }, id: \.self) { name in
                Text(name)
            }
        }
    }
}

#Preview {
    ContentView()
}

struct PetListView: View {
    let animals: [String]
    var body: some View {
        List(animals, id: \.self) { animal in
            Text(animal)
                .background(Color.yellow)
        }
        .listStyle(.plain)
    }
}
