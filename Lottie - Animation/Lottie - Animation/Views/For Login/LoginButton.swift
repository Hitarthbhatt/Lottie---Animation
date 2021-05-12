//
//  LoginButton.swift
//  Senpiper - Users
//
//  Created by Hitarth on 11/05/21.
//

import SwiftUI

struct LoginButton: View {
    
    var title: String
    var color: Color
    var action = {}
    
    var body: some View {
        
        Button(action: action, label: {
            
            Text(title)
                .font(.title3)
                .foregroundColor(.white)
            
        }).frame(width: Sizes.screenWidth/1.2, height: 50, alignment: .center)
        .background(color)
        .cornerRadius(5)

        
    }
}

