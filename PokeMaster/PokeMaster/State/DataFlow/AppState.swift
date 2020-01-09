//
//  AppState.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/9.
//  Copyright © 2020 huangjian. All rights reserved.
//

import Foundation


struct AppState {
    var settings = Settings()
    
}


extension AppState {
    struct Settings {
        enum Sorting: CaseIterable {
            case id, name, color, favorite
        }
        enum AccountBehavior: CaseIterable {
            case register, login
        }
        
        var accountBehavior = AccountBehavior.login
        var email = ""
        var password = ""
        var verifyPassword = ""
        
//        class AccountChecker {
//            @Published var accountBehavior = AccountBehavior.login
//            @Published var email = ""
//            @Published var password = ""
//            @Published var verifyPassword = ""
//        }

        var showEnglishName = true
        var sorting = Sorting.id
        var showFavoriteOnly = false

//        var checker = AccountChecker()
        
        var loginUser: User?
        
        var loginRequesting = false
    }
}
