//
//  AppConfig.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/6.
//  Copyright © 2020 huangjian. All rights reserved.
//

import Foundation
import UIKit

func ScaleFrame(_ float: CGFloat) -> CGFloat {
    let scale = UIScreen.main.bounds.width / 375
    
    return scale * float
}

func imgString(_ id: Int) -> String {
    return "Pokemon-\(id)"
}


let format = DateFormatter()

func TTLog<T>(_ message:T,file:String = #file,funcName:String = #function,lineNum:Int = #line){
    
    #if DEBUG
    let date = Date()
    format.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS Z"
    let str = format.string(from: date)
    let file = (file as NSString).lastPathComponent;
    print("\(str) \(file):(\(lineNum)) \(message)");
    #endif
}
