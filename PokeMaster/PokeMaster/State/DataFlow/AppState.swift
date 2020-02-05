//
//  AppState.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/9.
//  Copyright © 2020 huangjian. All rights reserved.
//

import Foundation
import Combine

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
        
//        var accountBehavior = AccountBehavior.login
//        var email = ""
//        var password = ""
//        var verifyPassword = ""
        
        class AccountChecker {
            @Published var accountBehavior = AccountBehavior.login
            @Published var email = ""
            @Published var password = ""
            @Published var verifyPassword = ""
            
            var isEmailValid: AnyPublisher<Bool, Never> {
                /// debounce，removeDuplicates 过滤掉输入抖动和重复输入，这样我们将能尽量减少 API 调用。
                let remoteVerify = $email
                    .debounce(
                        for: .milliseconds(500),
                        scheduler: DispatchQueue.main
                )
                    .removeDuplicates()
                    .flatMap { email -> AnyPublisher<Bool, Never> in
                        let validEmail = email.isValidEmailAddress
                        let canSkip = self.accountBehavior == .login
                        TTLog("Email : \(email)")
                        switch (validEmail, canSkip) {
                        case (false, _):
                            return Just(false).eraseToAnyPublisher()
                        case (true, false): // 注册 假装网络请求校验
                            return EmailCheckingRequest(email: email)
                                .publisher
                        case (true, true):
                            return Just(true).eraseToAnyPublisher()
                        }
                }
                
                let emailLocalValid = $email.map { $0.isValidEmailAddress }
                let canSkipRemoteVerify = $accountBehavior.map { $0 == .login }
                
                return Publishers.CombineLatest3(
                    emailLocalValid, canSkipRemoteVerify, remoteVerify
                )
                    .map { $0 && ($1 || $2) }
                    .eraseToAnyPublisher()
            }
        }
        var checker = AccountChecker()
        
        var isEmailValid: Bool = false
        
        @UserDefaultsStorege(key: kIsShowEnglishName)
        var showEnglishName
        
        var sorting = Sorting.id
        
        @UserDefaultsStorege(key: kIsShowFavoriteOnly)
        var showFavoriteOnly

        /// 初始化时通过 loadJSON 从磁盘上的 “user.json” 文件中进行读取
        /// 设置 loginUser 时，如果值存在，那么将它序列化并写到文件中。
        ///  loginUser 设为 nil 时，作为纯副作用，我们将 user.json 删除
        @FileStorege(directory: .documentDirectory, fileName: userJson)
        var loginUser: User? /*= try? FileHelper.loadJSON(from: .documentDirectory, fileName: userJson) {
            didSet {
                if let value = loginUser {
                    try? FileHelper.writeJSON(value, to: .documentDirectory, fileName: userJson)
                }else{
                    try? FileHelper.delete( from: .documentDirectory, fileName: userJson)
                }
            }
            
        }*/
            
    
        
        var loginRequesting = false
        
        var loginError: AppError?
        
    }
}
