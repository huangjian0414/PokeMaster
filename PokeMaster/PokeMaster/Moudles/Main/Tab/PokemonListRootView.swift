//
//  PokemonListRootView.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/7.
//  Copyright © 2020 huangjian. All rights reserved.
//

import SwiftUI

struct PokemonListRootView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        NavigationView{
            if store.appState.pokemonList.pokemons == nil {
                Text("Loading!").onAppear { self.store.dispatch(.loadPokemons)}
            }else{
                PokemonList() .navigationBarTitle("宝可梦列表")
            }
        }
    }
}

struct PokemonListRootView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListRootView()
    }
}
