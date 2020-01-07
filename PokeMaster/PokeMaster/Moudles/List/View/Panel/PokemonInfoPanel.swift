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
    /// pokemon描述文本
    var pokemonDescription: some View {
        Text(model.descriptionText)
            .font(.callout)
            .foregroundColor(Color(hex: 0x666666))
            .fixedSize(horizontal: false, vertical: true)
    }
    
    @State var darkBlur = false
    var body: some View {
        VStack(spacing: ScaleFrame(20)) {
            Button(action: {
                self.darkBlur.toggle()
            }) {
                Text("切换模糊效果")
            }
            topIndicator
            Header(model: model)
            pokemonDescription
            Divider()
            AbilityList(model: model, abilityModels: abilities)
        }
        .padding(EdgeInsets(
            top: ScaleFrame(12),
            leading: ScaleFrame(30),
            bottom: ScaleFrame(30),
            trailing: ScaleFrame(30)
            )
        )
            .blurBackground(style: darkBlur ? .systemMaterialDark : .systemMaterial)
            .cornerRadius(ScaleFrame(20))
            .fixedSize(horizontal: false, vertical: true)
    }
}

struct PokemonInfoPanel_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoPanel(model: .sample(id: 1))
    }
}
