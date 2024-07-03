//
//  ContentView.swift
//  LocalApp
//
//  Created by 김혜림 on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    @State var changeColor = false
    @State var message = ""
    
    var placeHolder: LocalizedStringKey = "placeholder-label"
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey("greeting-label \(message)"))
            Text("greeting-label \(message)")
            Button("button-label") {
                changeColor.toggle()
            }
            TextField(placeHolder, text: $message)
        }
        .padding()
        .background(changeColor ? Color.red : Color.yellow)
    }
}

#Preview("기본-한국어") {
    ContentView()
}

#Preview("English") {
    ContentView()
        .environment(\.locale, .init(identifier: "en"))
}

#Preview("French") {
    ContentView()
        .environment(\.locale, .init(identifier: "fr"))
}

#Preview("Spanish") {
    ContentView()
        .environment(\.locale, .init(identifier: "sp"))
}
