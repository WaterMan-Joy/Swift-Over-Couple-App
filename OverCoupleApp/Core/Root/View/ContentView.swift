//
//  ContentView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/19.
//

import SwiftUI

struct ContentView: View {
    
//    @EnvironmentObject var viewModel: LoginViewModel
    @StateObject var loginViewModel = LoginViewModel()

    var body: some View {
        NavigationStack {
            if loginViewModel.userSession == nil {
                LoginView()
                    .environmentObject(loginViewModel)
            }
            else {
                MainTabView()
                    .environmentObject(loginViewModel)
            }
//            switch loginViewModel.state {
//                case .signedIn: MainTabView()
//                    .environmentObject(loginViewModel)
//
//                case .signedOut: LoginView()
//                    .environmentObject(loginViewModel)
//
//
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
