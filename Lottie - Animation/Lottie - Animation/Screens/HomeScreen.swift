//
//  HomeScreen.swift
//  Senpiper - Users
//
//  Created by Hitarth on 11/05/21.
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject var userModel: UserViewModel
    @Binding var showSheet: Bool
    
    var body: some View {
        
        ZStack {
            VStack {
                NavBar(showSheet: self.$showSheet, userModel: self.userModel)
                
                if userModel.showProgress {
                    ProgressView()
                        .padding(.vertical)
                }
                
                userList()
                
                Spacer()
                
                //VStack
            }
            
            if userModel.showLottie {
                LottieController(lottieName: "complete", showLottie: self.$userModel.showLottie)
                    .frame(width: Sizes.screenWidth/2, height: Sizes.screenWidth/2)
                    .cornerRadius(10)
            }
            
            //ZStack
        }.ignoresSafeArea(edges: .all)
        .onAppear {
            loadData()
            //On Appear
        }
        
    }
    
    
    fileprivate func loadData() {
        if userModel.users.isEmpty {
            userModel.showProgress.toggle()
            userModel.fetchUsers { (result) in
                switch result {
                    
                    case .success(let users):
                        DispatchQueue.main.async {
                            userModel.users = users
                            userModel.showProgress.toggle()
                        }
                        
                    case .failure(_):
                        userModel.showProgress.toggle()
                        break
                }
            }
        }
    }
    
    fileprivate func userList() -> some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(userModel.users, id: \.self) { user in
                
                ListBlockView(userName: user)
                
            }
        }
        
    }
    
}





