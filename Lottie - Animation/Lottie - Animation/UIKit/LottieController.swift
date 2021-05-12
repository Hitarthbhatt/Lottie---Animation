//
//  LottieController.swift
//  Senpiper - Users
//
//  Created by Hitarth on 11/05/21.
//

import Lottie
import SwiftUI

struct LottieController: UIViewRepresentable {
    
    var lottieName: String
    @Binding var showLottie: Bool
    
    func makeUIView(context: Context) -> some AnimationView {
        
        let animationView = AnimationView(name: lottieName)
        animationView.contentMode = .scaleAspectFit
        animationView.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.2980392157, blue: 0.537254902, alpha: 1)
        animationView.play { (complete) in
            if complete {
                self.showLottie = false
            }
        }
        
        
        return animationView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    
    
}
