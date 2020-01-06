//
//  PokemonInfoRow.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/6.
//  Copyright © 2020 huangjian. All rights reserved.
//

import SwiftUI

struct PokemonInfoRow: View {
    let model: PokemonViewModel
    let expanded: Bool
    
    var body: some View {
        VStack {
            HStack {
                Image(imgString(model.id))
                    ///按照所在的 frame 缩放
                    .resizable()
                    .frame(width: ScaleFrame(50), height: ScaleFrame(50))
                    ///让图片能够保持原始比例
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: ScaleFrame(4))
                Spacer()
                VStack (alignment: .trailing) {
                    Text(model.name)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    Text(model.nameEN)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    
                }
            }
            .padding(.top, ScaleFrame(12))
            Spacer()
            HStack (spacing: expanded ? ScaleFrame(20) : -ScaleFrame(30)) {
                Spacer()
                Button(action: {}){
                    Image(systemName: "star")
                    .modifier(ToolButtonModifier())
                }
                Button(action: {}){
                    Image(systemName: "chart.bar")
                    .modifier(ToolButtonModifier())
                }
                Button(action: {}){
                    Image(systemName: "info.circle")
                    .modifier(ToolButtonModifier())
                }
                
            }
            .padding(.bottom, ScaleFrame(12))
            .opacity(expanded ? 1.0 : 0.0)
            .frame(maxHeight: expanded ? .infinity : 0)
        }
        .frame(height: expanded ? ScaleFrame(120) : ScaleFrame(80))
        .padding(.leading, ScaleFrame(23))
        .padding(.trailing, ScaleFrame(15))
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: ScaleFrame(20))
                    .stroke(model.color, style: StrokeStyle(lineWidth: ScaleFrame(4)))
                RoundedRectangle(cornerRadius: ScaleFrame(20))
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.white, model.color]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            }
        )
        .padding(.horizontal)
        .animation(
            .spring(
                response: 0.55,
                dampingFraction: 0.425,
                blendDuration: 0)
        )
    }
}

//MARK: - 避免这种对 View 的重复设置
struct ToolButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 25))
            .foregroundColor(.white)
            .frame(width: ScaleFrame(30), height: ScaleFrame(30))
    }
}
//MARK: - 预览
struct PokemonInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PokemonInfoRow(model: .sample(id: 1), expanded: false)
            PokemonInfoRow(model: .sample(id: 21), expanded: true)
            PokemonInfoRow(model: .sample(id: 15), expanded: false)
        }
    }
}
