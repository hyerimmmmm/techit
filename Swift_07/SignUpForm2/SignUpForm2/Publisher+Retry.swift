//
//  Publisher+Retry.swift
//  SignUpForm2
//
//  Created by 김혜림 on 6/20/24.
//

import Foundation
import Combine

extension Publisher {
    func retry<T, E> (_ retryCount: Int, withBackoff initialBackoff: Int, condition: ((E) -> Bool)? = nil) -> Publishers.TryCatch<Self, AnyPublisher<T, E>> where T == Self.Output, E == Self.Failure {
        return self.tryCatch { error -> AnyPublisher<T, E> in
            if condition?(error) == true {
                var backOff = initialBackoff
                return Just(Void())
                    .flatMap { _ -> AnyPublisher<T, E> in
                        let result = Just(Void())
                            .delay(for: .init(integerLiteral: backOff), scheduler: DispatchQueue.global())
                            .flatMap { _ in return self }
                        backOff = backOff * 2
                        return result.eraseToAnyPublisher()
                    }
                    .retry(retryCount)
                    .eraseToAnyPublisher()
            } else {
                throw error
            }
        }
    }
}
