//
//  UserProfileScreen.swift
//  StateManagement
//
//  Created by 김혜림 on 6/17/24.
//

import SwiftUI

struct UserProfileScreen: View {
    @EnvironmentObject var profile: UserProfile
    
    var body: some View {
        VStack(alignment: .leading) {
            Form {
                Section(header: Text("User Profile")) {
                    TextField("name", text: $profile.name)
                    TextField("Favorite Programming Languqge", text: $profile.favoriteProgrammingLanguage)
                    ColorPicker("Favorite Color", selection: $profile.favoriteColor)
                }
            }
        }
        .navigationTitle("User Profiles")
    }
}

#Preview {
    NavigationStack {
        UserProfileScreen()
    }
    .environmentObject(UserProfile(name: "Peter", favoriteProgrammingLanguage: "Swift", favoriteColor: .pink))
}
