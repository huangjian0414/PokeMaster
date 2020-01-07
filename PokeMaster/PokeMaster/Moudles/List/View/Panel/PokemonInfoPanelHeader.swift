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
        
        var nameSpecies: some View {
            VStack(spacing: ScaleFrame(10)) {
                VStack {
                    Text(model.name)
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(model.color)
                    Text(model.nameEN)
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                        .foregroundColor(model.color)
                }
                Text(model.genus)
                    .font(.system(size: 13))
                    .fontWeight(.bold)
                    .foregroundColor(model.color)
            }
        }
        
        var verticalDivider: some View {
            RoundedRectangle(cornerRadius: ScaleFrame(1))
                .frame(width: ScaleFrame(1), height: ScaleFrame(44))
                .opacity(0.1)
        }
        
        var bodyStatus: some View {
            VStack(alignment: .leading) {
                HStack {
                    Text("身高")
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                    Text(model.height)
                        .font(.system(size: 11))
                        .foregroundColor(model.color)
                }
                HStack {
                    Text("体重")
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                    Text(model.height)
                        .font(.system(size: 11))
                        .foregroundColor(model.color)
                }
            }
        }
        
        var typeInfo: some View {
            HStack {
                ForEach(self.model.types) { type in
                    ZStack {
                        RoundedRectangle(cornerRadius: ScaleFrame(7))
                            .fill(type.color)
                            .frame(width: ScaleFrame(36), height: ScaleFrame(14))
                        Text(type.name)
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                    }
                }
            }
        }
        
        
        var body: some View {
            HStack(spacing: ScaleFrame(18)) {
                pokemonIcon
                nameSpecies
                verticalDivider
                VStack(spacing: ScaleFrame(12)) {
                    bodyStatus
                    typeInfo
                }
            }
        }
    }
}
struct PokemonInfoPanelHeader_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoPanel.Header(model: .sample(id: 1))
    }
}
