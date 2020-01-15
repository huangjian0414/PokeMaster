//
//  Store.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/9.
//  Copyright © 2020 huangjian. All rights reserved.
//

import Foundation
import Combine

class Store: ObservableObject {
    @Published var appState = AppState()
    var futureCan: AnyCancellable?
    
    func dispatch(_ action: AppAction) {
        #if DEBUG
        print("[ACTION]: \(action)")
        #endif
//        let result = Store.reduce(state: appState, action: action)
//        appState = result
        
        let result = Store.reduce(state: appState, action: action)
        appState = result.0
        if let command = result.1 {
            #if DEBUG
            print("[COMMAND]: \(command)")
            #endif
            command.execute(in: self)
        }
    }
    
    static func reduce(state: AppState, action: AppAction) -> (AppState, AppCommand?) {
        var appstate = state
        var appCommand: AppCommand?
        switch action {
        case .login(let email, let password):
            guard !appstate.settings.loginRequesting else {
                break
            }
            appstate.settings.loginRequesting = true
            appCommand = LoginAppCommand(
              email: email, password: password
            )
//            if password == "111111" {
//                let user = User(email: email, favoritePokemonIDs: [])
//                appstate.settings.loginUser = user
//            }
            
            //return appstate
        case .accountBehaviorDone(let result) :
            appstate.settings.loginRequesting = false
            switch result {
            case .success(let user):
                appstate.settings.loginUser = user
            case .failure(let error):
                TTLog("Error: \(error)")
                appstate.settings.loginError = error
            }
        case .logout:
            appstate.settings.loginUser = nil
            appstate.settings.password = ""
            appstate.settings.showEnglishName = false
            appstate.settings.showFavoriteOnly = false
        }
        return (appstate, appCommand)
    }
}
