//
//  UserDefaultsStorege.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/15.
//  Copyright © 2020 huangjian. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefaultsStorege {
    var value: Bool
    let key: String
    
    init(key: String) {
        value = UserDefaults.standard.bool(forKey: key)
        self.key = key
    }
    var wrappedValue: Bool {
        set {
            if value != newValue {
                value = newValue
                UserDefaults.standard.set(value, forKey: key)
                UserDefaults.standard.synchronize()
            }
        }
        get {
            value
        }
    }
}
