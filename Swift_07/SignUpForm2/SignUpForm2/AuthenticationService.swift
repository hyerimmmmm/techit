//
//  AuthenticationService.swift
//  SignUpForm2
//
//  Created by 김혜림 on 6/20/24.
//

import Foundation
import Combine

struct AuthenticationService {
    func checkUserNameAvailablePublisher(userName: String) -> AnyPublisher<Bool, Error> {
        guard let url = URL(string: "http://127.0.0.1:8080/isUserNameAvailable?username=\(username)") else {
            return Fail(error: APIError.invaildResponse).eraseToAnyPublisher()
        }
        
        // 서버로부터 받은 데이터를 스트림으로 처리
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: UserNameAvailableMessage.self, decoder: JSONDecoder())
            .map(\.isAvailable)
            .eraseToAnyPublisher()
    }
}
