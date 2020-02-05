//
//  EmailCheckingRequest.swift
//  PokeMaster
//
//  Created by Jayehuang on 2020/2/5.
//  Copyright © 2020 huangjian. All rights reserved.
//
import Foundation
import Combine

struct EmailCheckingRequest {
    let email: String

    var publisher: AnyPublisher<Bool, Never> {
        Future<Bool, Never> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
                if self.email.lowercased() == "12345@qq.com" {
                    promise(.success(true))
                } else {
                    promise(.success(false))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
