//
//  AuthenticationService.swift
//  SignUpForm
//
//  Created by 김혜림 on 6/19/24.
//

import Foundation
import Combine

struct UserNameAvailableMessage: Codable {
    var isAvailable: Bool
    var userName: String
}

enum NetworkError: Error {
    case transportError(Error)
    case serverError(ststusCode: Int)
    case noData
    case decodingError(Error)
    case encodingError(Error)
}

class AuthenticationService {
    func checkUserNameAvailable(userName: String) -> AnyPublisher<Bool, Never> {
        guard let url = URL(string: "http://127.0.0.1:8080/isUserNameAvailable?userName=\(userName)") else {
            return Just(false).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: UserNameAvailableMessage.self, decoder: JSONDecoder())
            .map(\.isAvailable)
            .replaceError(with: false)
            .eraseToAnyPublisher()
    }
    
    func checkUserNameAvailableWithClosure(userName: String,complection: @escaping (Result<Bool, NetworkError>) -> Void) {
        let url = URL(string: "http://127.0.0.1:8080/isUserNameAvailable?userName=\(userName)")!
        
        let task = URLSession.shared.dataTask(with: url) { data, responese, error in
            if let error = error {
                complection(.failure(.transportError(error)))
                return
            }
            if let responese = responese as? HTTPURLResponse, !(200..<300).contains(responese.statusCode) {
                complection(.failure(.serverError(ststusCode: responese.statusCode)))
                return
            }
            guard let data = data else {
                complection(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let userAvailableMessage = try decoder.decode(UserNameAvailableMessage.self, from: data)
                
                complection(.success(userAvailableMessage.isAvailable))
            } catch {
                complection(.failure(.decodingError(error)))
            }
        }
        
        task.resume()
    }
}
