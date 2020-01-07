//
//  PokemonList.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/6.
//  Copyright © 2020 huangjian. All rights reserved.
//

import SwiftUI

struct PokemonList: View {
    /// 记录展开id
    @State var expandingIndex: Int?
    @State var searchText: String = ""
    @State var showPanel = false
    var body: some View {
        ScrollView {
            TextField ("搜索", text: $searchText)
                .frame(height: ScaleFrame(40))
                .padding(.horizontal, ScaleFrame(25))
            ForEach(PokemonViewModel.all) { pokemon in
                PokemonInfoRow(model: pokemon, expanded: self.expandingIndex == pokemon.id)
                    .onTapGesture {
                        if self.expandingIndex == pokemon.id {
                            self.expandingIndex = nil
                        } else {
                            self.expandingIndex = pokemon.id
                        }
                }
            }
        }.overlay(
            VStack {
                Spacer()
                Button("PokemonInfoPanel") {
                    self.showPanel = true
                }.sheet(isPresented: $showPanel) {
                    PokemonInfoPanel(model: .sample(id: 1))
                }
            }.edgesIgnoringSafeArea(.bottom)
        )
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
