//
//  SettingRootView.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/7.
//  Copyright © 2020 huangjian. All rights reserved.
//

import SwiftUI

struct SettingRootView: View {
    var body: some View {
        NavigationView {
            SettingView().navigationBarTitle("设置")
        }
    }
}

struct SettingRootView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRootView()
    }
}
