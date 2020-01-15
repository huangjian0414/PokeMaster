//
//  ActivityIndicatorView.swift
//  PokeMaster
//
//  Created by huangjian on 2020/1/15.
//  Copyright © 2020 huangjian. All rights reserved.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorView>) -> UIView {
        
        let activityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicatorView.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<ActivityIndicatorView>) {
        
    }
   
}


