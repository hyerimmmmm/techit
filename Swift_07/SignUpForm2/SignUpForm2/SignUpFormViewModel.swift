//
//  SignUpFormViewModel.swift
//  SignUpForm2
//
//  Created by 김혜림 on 6/20/24.
//

import Foundation
import Combine

class SignUpFormViewModel: ObservableObject {
    typealias Available = Result<Bool, Error>
    
    @Published var username: String = ""
    @Published var usernameMessage: String = ""
    @Published var isValid: Bool = false
    @Published var showupdateDialong: Bool = false
    
    private var authenticationService = AuthenticationService()
    
    // 스트림
    private lazy var isUsernameAvailablePublisher: AnyPublisher<Available, Never> = {
        $username
            .debounce(for: 0.5, scheduler: RunLoop.main) // 전송 속도 조절
            .removeDuplicates()// 같은 문자열 2번 서버로 보내지 않도록 필터링
            .flatMap { username -> AnyPublisher<Available, Never> in // 퍼블리셔를 중간에 하나 더 끼우기
                self.authenticationService.checkUserNameAvailablePublisher(userName: username)
                    .asResult()
            }
            .receive(on: DispatchQueue.main)
            .print("before share")
            .share() // 결과 공유
            .print("Share")
            .eraseToAnyPublisher()
    }()
    
    init() {
        isUsernameAvailablePublisher.map { result in
            switch result {
            case .success(let isAvailabel):
                return isAvailabel
            case .failure(_):
                return false
            }
        }
        .assign(to: &$isValid)
    }
}
