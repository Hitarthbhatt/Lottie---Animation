//
//  NavBar.swift
//  Senpiper - Users
//
//  Created by Hitarth on 11/05/21.
//

import SwiftUI

struct NavBar: View {
    
    @Binding var showSheet: Bool
    @ObservedObject var userModel: UserViewModel
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            HStack(alignment: .bottom) {
                
                Button(action: {
                    
                    self.showSheet.toggle()
                    
                }, label: {
                    Image(systemName: "chevron.backward.circle")
                        .imageScale(.large)
                        .foregroundColor(.background)
                })
                
                Spacer()
                
                Text("Home")
                    .font(.title)
                    .foregroundColor(.background)
                
                
                Spacer()
                
                Button(action: {
                    
                    loadData()
                    
                }, label: {
                    Image(systemName: "arrow.counterclockwise.circle")
                        .imageScale(.large)
                        .foregroundColor(.background)
                })
                
                
            }.padding([.top, .horizontal])
            .frame(height: Sizes.screenHeight/10)
            .background(Color.gray.opacity(0.05))
            
            
            //ZStack
        }
    }
    
    
    fileprivate func loadData() {
        
        userModel.showProgress.toggle()
        userModel.fetchUsers { (result) in
            switch result {
                
                case .success(let users):
                    DispatchQueue.main.async {
                        userModel.users = users
                        userModel.showProgress.toggle()
                        userModel.showLottie = true
                    }
                    
                case .failure(_):
                    userModel.showProgress.toggle()
                    break
            }
        }
    }
    
    
}

