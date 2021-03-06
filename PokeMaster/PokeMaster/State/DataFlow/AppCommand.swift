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
        TTLog("LoginAppCommand")
        LoginRequest(email: email, password: password).publisher
            .sink(receiveCompletion: { (complete) in
                TTLog("11111")
                if case .failure(let error) = complete {
                    store.dispatch(.accountBehaviorDone(result: .failure(error)))
                }
            }, receiveValue: { (user) in
                TTLog("22222")
                store.dispatch(.accountBehaviorDone(result: .success(user)))
            }).add(to: store.bag)
    }
    
}

struct WriteUserAppCommand: AppCommand {
    
    let user: User
    
    
    func execute(in store: Store) {
        try? FileHelper.writeJSON(user, to: .documentDirectory, fileName: userJson)
    }
}

struct LoadPokemonsCommand: AppCommand {
    func execute(in store: Store) {
        LoadPokemonRequest.all
            .sink(
                receiveCompletion: { complete in
                    if case .failure(let error) = complete {
                        store.dispatch(.loadPokemonsDone(result: .failure(error)))
                    }
                }, receiveValue: { value in
                    store.dispatch(.loadPokemonsDone(result: .success(value)))
                }
            ).add(to: store.bag)
    }
}
