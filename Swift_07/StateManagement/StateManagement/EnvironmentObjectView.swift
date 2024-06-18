//
//  EnvironmentObjectView.swift
//  StateManagement
//
//  Created by 김혜림 on 6/17/24.
//

import SwiftUI

class UserProfile: ObservableObject {
    @Published var name: String
    @Published var favoriteProgrammingLanguage: String
    @Published var favoriteColor: Color
    
    init(name: String, favoriteProgrammingLanguage: String, favoriteColor: Color) {
        self.name = name
        self.favoriteProgrammingLanguage = favoriteProgrammingLanguage
        self.favoriteColor = favoriteColor
    }
}

struct EnvironmentObjectView: View {
    @StateObject var profile = UserProfile(name: "Peter1", favoriteProgrammingLanguage: "Swift", favoriteColor: .pink)
    @State var inSettingShown = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Form {
                Section {
                    Text("This is just some random data")
                    Text("Let's assume this was the main of an app")
                    Text("Tap the cog icon to go to the fake settings screen")
                }
            }
            HStack {
                Text("Sign in as \(profile.name)")
                    .foregroundStyle(Color(UIColor.systemBackground))
                Spacer()
            }
            .padding()
            .background(profile.favoriteColor)
            .navigationTitle("@EnviraonmentObject")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: showSetting) {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .sheet(isPresented: $inSettingShown) {
                NavigationStack {
                    SettingScreen()
                }
            }
        }
    }
    func showSetting() {
        inSettingShown.toggle()
    }
}

#Preview {
    NavigationStack {
        EnvironmentObjectView()
    }
}
