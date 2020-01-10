//
//  AppCommand.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/9.
//  Copyright © 2020 huangjian. All rights reserved.
//

import Foundation
///需要执行的副作用

protocol AppCommand {
    func execute(in store: Store)
}

struct LoginAppCommand: AppCommand {
    let email: String
    let password: String
    
    
    func execute(in store: Store) {
        print("LoginAppCommand")
        store.futureCan = LoginRequest(email: email, password: password).publisher
            .sink(receiveCompletion: { (complete) in
                print("11111")
                if case .failure(let error) = complete {
                    store.dispatch(.accountBehaviorDone(result: .failure(error)))
                    store.futureCan = nil
                }
            }, receiveValue: { (user) in
                print("22222")
                store.dispatch(.accountBehaviorDone(result: .success(user)))
                store.futureCan = nil
            })
    }
    
}
