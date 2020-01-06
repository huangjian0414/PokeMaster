//
//  PokemonInfoPanel.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/6.
//  Copyright © 2020 huangjian. All rights reserved.
//

import SwiftUI

struct PokemonInfoPanel: View {
    let model: PokemonViewModel
    /// 技能
    var abilities: [AbilityViewModel] {
        AbilityViewModel.sample(pokemonID: model.id)
    }
    
    /// 最上面指示视图
    var topIndicator: some View {
        RoundedRectangle(cornerRadius: ScaleFrame(3))
            .frame(width: ScaleFrame(40), height: ScaleFrame(6))
            .opacity(0.2)
    }
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PokemonInfoPanel_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoPanel(model: .sample(id: 1))
    }
}
