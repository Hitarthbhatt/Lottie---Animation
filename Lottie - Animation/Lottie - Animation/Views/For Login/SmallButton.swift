//
//  SmallButtons.swift
//  Senpiper - Users
//
//  Created by Hitarth on 11/05/21.
//

import SwiftUI


struct SmallButton: View {
    
    var title: String
    var description: String = ""
    var color: Color
    
    var body: some View {

        Button(action: {}, label: {
            
            HStack {
                Text(description)
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(color)
                
            }.padding(.horizontal)
                
            
        })
        
    }
}
