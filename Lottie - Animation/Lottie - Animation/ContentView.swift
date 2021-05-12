//
//  ContentView.swift
//  Lottie - Animation
//
//  Created by Hitarth on 12/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var userModel = UserViewModel()
    
    var body: some View {
        LoginScreen(userModel: self.userModel)
    }
    
}

