//
//  ExploreView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var searchText: String = ""
    @StateObject var viewModel = ExploreViewModel()
    var body: some View {
        
        // explore view
        NavigationView(content: {
            
            
            VStack(content: {
                
                ScrollView(content: {
                    
                    LazyVStack(content: {
                        
                        ForEach(viewModel.users, content: { user in
                            NavigationLink(destination: {
                                ProfileView(user: user)
                            }, label: {
                                UserRowView(user: user)
                            }) //: NAVIGATION LINK
                            
                        }) //: FOR EACH
                        
                        
                    }) // : LAZY VSTACK
                    .searchable(text: $searchText, prompt: "커플 or 유저 검색")
                    
                }) //: SCROLL VIEW
                .refreshable {
                    Task {
                        try await viewModel.fetchAllUser()
                    }
                }
                
            }) //: VSTACK
            .navigationTitle("검색")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        print("CLICK RESET!")
                        Task {
                            try await viewModel.fetchAllUser()
                        }
                    }, label: {
                        Image(systemName: "arrow.clockwise")
                    })
                })
            })
            
        }) //: NAVIGATION VIEW
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
