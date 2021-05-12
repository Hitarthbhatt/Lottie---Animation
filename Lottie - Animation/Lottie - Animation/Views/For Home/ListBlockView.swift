//
//  ListBlockView.swift
//  Senpiper - Users
//
//  Created by Hitarth on 11/05/21.
//

import SwiftUI

struct ListBlockView: View {
    
    var userName: String
    
    var body: some View {
        
        HStack(alignment: .center) {
         
            Image(systemName: "\(userName.prefix(1).lowercased()).circle")
                .imageScale(.large)
                .foregroundColor(.background)
            
            
            Text(userName)
                .font(.headline)
                .foregroundColor(.black)
                .padding(.horizontal)
            
            Spacer()
            
        }.padding(.horizontal)
        .padding(.vertical, 15)
        .frame(width: Sizes.screenWidth/1.1, alignment: .center)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.background, lineWidth: 1.0))
        
    }
}

struct ListBlockView_Previews: PreviewProvider {
    static var previews: some View {
        ListBlockView(userName: "Hitarth")
    }
}
