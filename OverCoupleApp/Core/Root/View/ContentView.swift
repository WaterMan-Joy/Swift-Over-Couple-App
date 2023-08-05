//
//  ContentView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/19.
//

import SwiftUI

struct ContentView: View {
    
//    @EnvironmentObject var viewModel: LoginViewModel
    @StateObject var viewModel = ContentViewModel()


    var body: some View {
        Group {
//            LoginView()

            if viewModel.userSession == nil {
                LoginView()

            }
            else {
                if let currentUser = viewModel.currentUser {
                    MainTabView(user: currentUser)
                }
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
