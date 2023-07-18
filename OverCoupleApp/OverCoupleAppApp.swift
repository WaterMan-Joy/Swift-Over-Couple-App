//
//  OverCoupleAppApp.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI

@main
struct OverCoupleAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
//                MainTabView()
                    LoginView()
            }
        }
    }
}
