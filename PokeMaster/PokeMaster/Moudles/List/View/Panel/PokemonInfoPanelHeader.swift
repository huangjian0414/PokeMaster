//
//  PokemonInfoPanelHeader.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/6.
//  Copyright © 2020 huangjian. All rights reserved.
//

import SwiftUI


extension PokemonInfoPanel {
    
    struct Header: View {
        let model: PokemonViewModel
        
        var pokemonIcon: some View {
            Image(imgString(model.id))
                .resizable()
                .frame(width: ScaleFrame(68), height: ScaleFrame(68))
        }
        
        
        var body: some View {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}
struct PokemonInfoPanelHeader_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoPanel.Header(model: .sample(id: 1))
    }
}
