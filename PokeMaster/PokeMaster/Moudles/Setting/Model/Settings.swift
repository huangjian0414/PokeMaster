//
//  Settings.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/7.
//  Copyright © 2020 huangjian. All rights reserved.
//

import Foundation
import SwiftUI

//class Settings: ObservableObject {
    /// CaseIterable 协议给枚举的 allCases 属性自动产生所有的枚举的数组
//    enum AccountBehavior: CaseIterable {
//        case register, login
//    }
//    enum Sorting: CaseIterable {
//        case id, name, color, favorite
//    }
    
//    @Published var accountBehavior = AccountBehavior.login
//    @Published var email = ""
//    @Published var password = ""
//    @Published var verifyPassword = ""

//    @Published var showEnglishName = true
//    @Published var sorting = Sorting.id
//    @Published var showFavoriteOnly = false
//}

extension AppState.Settings.Sorting {
    var text: String {
        switch self {
        case .id:
            return "ID"
        case .name:
            return "名字"
        case .color:
            return "颜色"
        case .favorite:
            return "最爱"
        }
    }
    
}
extension AppState.Settings.AccountBehavior {
    var text: String {
        switch self {
        case .register:
            return "注册"
        case .login:
            return "登录"
        }
    }
    
}
