//
//  BlurView.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/7.
//  Copyright © 2020 huangjian. All rights reserved.
//

import SwiftUI
/// 模糊效果
struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    /// 返回要封装的 UIView 类型 ，SwiftUI 在创建一个被封 装的 UIView 时会对其调用
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        print("makeUIView")
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear

        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)

        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    /// 在 UIViewRepresentable 中的某个属性发生变化，SwiftUI 要求更新该 UIKit 部件时被调用
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlurView>) {
        print("updateUIView-- \(uiView)")
        
        for v in uiView.subviews {
            if v.isKind(of: UIVisualEffectView.classForCoder()) {
                let blurView = v as! UIVisualEffectView
                let blurEffect = UIBlurEffect(style: style)
                blurView.effect = blurEffect
            }
        }
    }
}

extension View {
    func blurBackground(style: UIBlurEffect.Style) -> some View {
        ZStack {
            BlurView(style: style)
            self
        }
    }
}
