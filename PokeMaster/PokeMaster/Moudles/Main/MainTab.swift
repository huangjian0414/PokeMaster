//
//  MainTab.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/9.
//  Copyright © 2020 huangjian. All rights reserved.
//

import SwiftUI

struct MainTab: View {
    var body: some View {
        TabView {
            PokemonListRootView().tabItem{
                Image(systemName: "list.bullet.below.rectangle")
                Text("列表")
            }
            SettingRootView().tabItem{
                Image(systemName: "gear")
                Text("设置")
            }
        }
        .edgesIgnoringSafeArea(.top)// 忽略安全区域的一组边。
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
    }
}
