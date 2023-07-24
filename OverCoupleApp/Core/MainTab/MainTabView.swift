//
//  MainTabView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI

struct MainTabView: View {

    @State private var selectedIndex: Int = 0
    
    
    let currentUser = User.MOCK_USERS[1]
    
    var body: some View {
        TabView(selection: $selectedIndex, content: {
            FeedView(user: currentUser)
                .onAppear {
                    self.selectedIndex = 0
                }
                .tabItem({
                    Image(systemName: "house.circle.fill")
                }).tag(0)
            
            ExploreView()
                .onAppear() {
                    self.selectedIndex = 1
                }
                .tabItem({
                    Image(systemName: "text.magnifyingglass")
                }).tag(1)
            
            ChatView()
                .onAppear {
                    self.selectedIndex = 2
                }
                .tabItem({
                    Image(systemName: "message.circle")
                }).tag(2)
            
            NotificationView()
                .onAppear {
                    self.selectedIndex = 3
                }
                .tabItem({
                    Image(systemName: "bell.circle")
                }).tag(3)
            
            CurrentUserView(user: currentUser)
                .navigationBarBackButtonHidden(true)
                .onAppear {
                    self.selectedIndex = 4
                }
                .tabItem({
                    Image(systemName: "person.circle")
                }).tag(4)
        }) //: TABVIEW
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
