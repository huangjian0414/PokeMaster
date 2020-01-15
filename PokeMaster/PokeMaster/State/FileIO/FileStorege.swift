//
//  FileStorege.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/15.
//  Copyright © 2020 huangjian. All rights reserved.
//

import Foundation

/// 减少重复代码
@propertyWrapper
struct FileStorege<T: Codable> {
    var value: T?
    
    let directory: FileManager.SearchPathDirectory
    let fileName: String

    init(directory: FileManager.SearchPathDirectory, fileName: String) {
        value = try? FileHelper.loadJSON(from: directory, fileName: fileName)
        self.directory = directory
        self.fileName = fileName
    }
    
    var wrappedValue: T? {
        set {
            value = newValue
            if let v = newValue {
                try? FileHelper.writeJSON(v, to: directory, fileName: fileName)
            }else{
                try? FileHelper.delete( from: directory, fileName: fileName)
            }
        }
        get {
            value
        }
    }
    
}
