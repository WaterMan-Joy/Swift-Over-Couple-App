//
//  OverCoupleAppApp.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct OverCoupleAppApp: App {
    
    init() {
        setupAuthentication()
      }

//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension OverCoupleAppApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
  }
}
