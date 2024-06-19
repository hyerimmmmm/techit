//
//  ContentView.swift
//  SignUpForm
//
//  Created by 김혜림 on 6/18/24.
//

import SwiftUI
import Combine

extension Publisher {
    func asResult() -> AnyPublisher<Result<Output, Failure>, Never> {
        self.map(Result.success)
            .catch { error in
                Just(.failure(error))
            }
            .eraseToAnyPublisher()
    }
}

class SignUpFormViewModel: ObservableObject {
    typealias Available = Result<Bool, Error>
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var passwordConfirmation: String = ""
    
    @Published var usernameMessage: String = ""
    @Published var passwordMessage: String = ""
    @Published var isValid: Bool = false
    
    @Published var isUserNameAvailable: Bool = false
    
    private let authenticationService = AuthenticationService()
    
    private var cancellables: Set<AnyCancellable> = []
    
    private lazy var isUsernameLengthValidPublisher: AnyPublisher<Bool, Never> = {
        $username.map { $0.count >= 3 }.eraseToAnyPublisher()
    }()
    
    private lazy var isPasswordEmptyPublisher: AnyPublisher<Bool, Never> = {
        $password.map(\.isEmpty).eraseToAnyPublisher()
    }()
    
    private lazy var isPasswordMatchingPublisher: AnyPublisher<Bool, Never> = {
        Publishers.CombineLatest($password, $passwordConfirmation)
            .map(==) // .map { $0 == $1 } 과 같은 뜻
            .eraseToAnyPublisher()
    }()
    
    private lazy var isPasswordValidPublisher: AnyPublisher<Bool, Never> = {
        Publishers.CombineLatest(isPasswordEmptyPublisher, isPasswordMatchingPublisher)
            .map { !$0 && $1 }
            .eraseToAnyPublisher()
    }()
    
    private lazy var isFormValidPublisher: AnyPublisher<Bool, Never> = {
        Publishers.CombineLatest3(isUsernameLengthValidPublisher, isUsernameAvailablePublisher, isPasswordValidPublisher)
            .map { isUsernameLengthValid, isUsernameAvailable, isPasswordVaild in
                switch isUsernameAvailable {
                case .success(let isAvailable):
                    return isUsernameLengthValid && isAvailable && isPasswordVaild
                case .failure:
                    return false
                }
            }
            .eraseToAnyPublisher()
    }()
    
    private lazy var isUsernameAvailablePublisher: AnyPublisher<Available, Never> = {
        $username
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap { username -> AnyPublisher<Available, Never> in
                self.authenticationService.checkUserNameAvailable(userName: username)
                    .asResult()
            }
            .receive(on: DispatchQueue.main)
            .share()
            .print("share")
            .eraseToAnyPublisher()
    }()
    
//    func checkUserNameAvailable(_ userName: String) {
//        authenticationService.checkUserNameAvailableWithClosure(userName: userName) { [weak self] result in
//            switch result {
//            case .success(let isAvailable):
//                self?.isUserNameAvailable = isAvailable
//            case .failure(let error):
//                print("error: \(error)")
//                self?.isUserNameAvailable = false
//            }
//        }
//    }
    
    init() {
//        $username
//            .debounce(for: 0.5, scheduler: DispatchQueue.main)
//            .sink { [weak self] username in
//                self?.checkUserNameAvailable(username)
//            }
//            .store(in: &cancellables)
        
        isFormValidPublisher.assign(to: &$isValid)
        
        // 3글자 이상 입력하지 않았을 경우 경고 문구 활성화
//        isUsernameLengthValidPublisher.map { $0 ? "" : "Username must be at least three chracters!" }
//            .assign(to: &$usernameMessage)
        
        Publishers.CombineLatest(isUsernameLengthValidPublisher, isUsernameAvailablePublisher)
            .map { isUsernameLengthVaild, isUserNameAvailable in
                switch (isUsernameLengthVaild, isUserNameAvailable) {
                case (false, _):
                    return "Username must be at least three characters!"
                case (_, .failure(let error)):
                    if case APIError.transportError(_) = error {
                        return "인터넷 연결을 확인하세요."
                    }
                    return "Error cheching username availablity: \(error.localizedDescription)"
                case (_, .success(false)):
                    return "This username is already taken."
                default:
                    return ""
                }
            }
            .assign(to: &$passwordMessage)
    }
}

struct ContentView: View {
    @StateObject var viewModel = SignUpFormViewModel()
    
    var body: some View {
        Form {
            // username
            Section {
                TextField("Username", text: $viewModel.username)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
            } footer: {
                Text(viewModel.usernameMessage)
                    .foregroundStyle(Color.red)
            }
            
            // password
            Section {
                SecureField("Password", text: $viewModel.password)
                SecureField("Repeat password", text: $viewModel.passwordConfirmation)
            } footer: {
                Text(viewModel.passwordMessage)
            }
            .foregroundColor(.red)
            
            // submit button
            Section {
                Button("Sign up") {
                    print("Signing up as \(viewModel.username)")
                }
                .disabled(!viewModel.isValid)
            }
        }
    }
}

#Preview {
    ContentView()
}
