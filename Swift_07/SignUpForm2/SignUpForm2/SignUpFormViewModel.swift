//
//  SignUpFormViewModel.swift
//  SignUpForm2
//
//  Created by 김혜림 on 6/20/24.
//

import Foundation

class SignUpFormViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var usernameMessage: String = ""
    @Published var isValid: Bool = false
    @Published var showupdateDialong: Bool = false
}
