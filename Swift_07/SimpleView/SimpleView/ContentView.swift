//
//  ContentView.swift
//  SimpleView
//
//  Created by 김혜림 on 6/17/24.
//

import SwiftUI

private class PersonViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    
    func save() {
        print("Save to disk")
    }
}

struct ContentView: View {
    @State var dirty = false
    @StateObject private var viewModel = PersonViewModel()
    
    var body: some View {
        Form {
            Section("\(self.dirty ? "* " : "")Input fields") {
                TextField("First name", text: $viewModel.firstName)
                    .onChange(of: viewModel.firstName) {
                        self.dirty = true
                    }
                    .onSubmit {
                        print("너만 있으면")
                    }
                TextField("Last name", text: $viewModel.lastName)
                    .onChange(of: viewModel.lastName) {
                        self.dirty = true
                    }
            }
            .onSubmit {
                viewModel.save()
                self.dirty = false
            }
        }
//        List {
//            Label("Hello World", systemImage: "globe")
//            HStack {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundColor(Color.accentColor)
//                Text("Hello, world!")
//            }
//            .font(.system(.body, design: .monospaced))
//            TextField("TextField", text: $text)
//            Button("Tap me") {
//                self.text = "You tapped me!"
//            }
//        }
    }
}

#Preview {
    ContentView()
}
