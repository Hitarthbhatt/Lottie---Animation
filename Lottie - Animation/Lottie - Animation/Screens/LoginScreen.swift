//
//  LoginScreen.swift
//  Senpiper - Users
//
//  Created by Hitarth on 11/05/21.
//

import SwiftUI

struct LoginScreen: View {
    
    @ObservedObject var userModel: UserViewModel
    @State var email: String = ""
    @State var password: String = ""
    
    @State var formOffset: CGFloat = 0
    @State var showSheet: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            
            SubscriptionView(content: contentView(), publisher: NotificationCenter.keyboardPublisher) { frame in
                withAnimation {
                    self.formOffset = frame.height > 0 ? -50 : 0
                }
                
            }
            
            if userModel.showLottie {
                LottieController(lottieName: "complete", showLottie: self.$userModel.showLottie)
                    .frame(width: Sizes.screenWidth/2, height: Sizes.screenWidth/2)
                    .cornerRadius(10)
            }
            
        }.fullScreenCover(isPresented: self.$showSheet) {
            HomeScreen(userModel: self.userModel, showSheet: self.$showSheet)
            //ZStack
        }
    }
    
    
    
    fileprivate func contentView() -> some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.4), radius: 1, x: 0, y: 0.5)
            
            loginContent()
            
        }.frame(width: Sizes.screenWidth/1.1, height: Sizes.screenHeight/2, alignment: .center)
        .offset(y: self.formOffset)
    }
    
    
    fileprivate func loginContent() -> some View {
        
        VStack(spacing: 10) {
            
            Text("Company Logo")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.background)
            
            Spacer()
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do")
                .font(.headline)
                .foregroundColor(.gray)
                .lineLimit(2)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            textFieldSection()
            
            LoginButton(title: "Login", color: (email.isEmpty || password.isEmpty) ? .gray : .button){
                
                userModel.showLottie.toggle()
                DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
                    self.showSheet.toggle()
                }
                
            }.disabled((email.isEmpty || password.isEmpty) ? true : false)
            .padding(.horizontal)
            
            SmallButton(title: "Sign Up", description: "Not registered?", color: .button)
            
            Spacer()
            
            SmallButton(title: "Reset company", color: .button)
            
            
            //VStack
        }.padding(.vertical)
    }
    
    
    
    
    fileprivate func textFieldSection() -> some View {
        
        VStack(alignment: .trailing, spacing: 10) {
            
            HStack(alignment: .center) {
                
                Text("+91")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1.0))
                
                TextField("Enter Email", text: $email)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1.0))
                    .onTapGesture {
                        self.email = "abc@xyz.test"
                    }
                
                //HStack
            }
            
            
            TextField("Enter Password", text: $password)
                .foregroundColor(.gray)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1.0))
                .onTapGesture {
                    self.password = "Abc00011"
                }
            
            SmallButton(title: "Forget password?", color: .background)
            
            //VStack
        }.padding(.horizontal)
        
    }
    
    
}

