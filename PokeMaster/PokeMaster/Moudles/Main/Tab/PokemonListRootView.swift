//
//  PokemonListRootView.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/7.
//  Copyright © 2020 huangjian. All rights reserved.
//

import SwiftUI

struct PokemonListRootView: View {
    var body: some View {
        NavigationView{
            PokemonList().navigationBarTitle("宝可梦列表")
        }
    }
}

struct PokemonListRootView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListRootView()
    }
}
