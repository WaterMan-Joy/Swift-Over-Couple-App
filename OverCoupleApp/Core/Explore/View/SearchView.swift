//
//  SearchView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/02.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var exploreViewModel: ExploreViewModel
    @Binding var searchText: String
    var users: [User] {
        return searchText.isEmpty ? exploreViewModel.users : exploreViewModel.filteredUser(searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(users) { user in
                    NavigationLink(destination: {
                        ProfileView(user: user)
                    }, label: {
                        SearchCell(user: user)
                    })
                }
            }
        }
    }
}


