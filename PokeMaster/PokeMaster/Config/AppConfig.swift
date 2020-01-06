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
