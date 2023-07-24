//
//  SideMenuView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import SwiftUI

struct SideMenuView: View {
    
    let user: User
    @EnvironmentObject var viewModel: ContentViewModel

    var body: some View {
        
        // side menu view
        VStack(spacing: 40, content: {
            
            // user name + user image + couple name + couple image
            VStack(alignment: .leading, content: {
                SideMenuRowView(user: user)
            })
            .padding(.all, 50)
            .background(.pink)
            .cornerRadius(20)
            
            // sie menus
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { sideMenu in
                
                if sideMenu == .profile {
                    NavigationLink {
                        CurrentUserView(user: user)
                    } label: {
                        SideMenuItemRowView(viewModel: sideMenu)
                    }
                }
                else if sideMenu == .lists {
                    NavigationLink {
                        Text("LISTS")
                    } label: {
                        SideMenuItemRowView(viewModel: sideMenu)
                    }
                }
                else if sideMenu == .bookmarks {
                    NavigationLink {
                        Text("BOOK MARKS")
                    } label: {
                        SideMenuItemRowView(viewModel: sideMenu)
                    }
                }
                else {
                    NavigationLink {
                        Text("??")
                    } label: {
                        SideMenuItemRowView(viewModel: sideMenu)
                    }
                }

            } //: FOR EACH / sie menus
            
            Button(action: {
                viewModel.service.signOut()
            }, label: {
                Text("LOG OUT")
            })
            
            Spacer()
            
        }) //: VSTACK / side menu view
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(user: User.MOCK_USERS[0])
    }
}
