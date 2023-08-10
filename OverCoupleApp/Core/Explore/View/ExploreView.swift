//
//  ExploreView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI

struct ExploreView: View {
    
    // VM
    @ObservedObject var exploreViewModel = ExploreViewModel()
    
    // STATE
    @State var searchText: String = ""
    
    // BODY
    var body: some View {
        
        // explore view
        NavigationView(content: {
            
            VStack(content: {
                
                ScrollView(content: {
                    
                    LazyVStack(content: {
                        
                        ZStack {
                            if searchText.isEmpty {
                                PostGridView(exploreViewModel: exploreViewModel)
                            } else {
                                SearchView(exploreViewModel: exploreViewModel, searchText: $searchText)
                            }
                        }
                    }) // : LAZY VSTACK
                    .searchable(text: $searchText, prompt: "커플 or 유저 검색")
                    
                }) //: SCROLL VIEW
                .refreshable {
                    Task {
                        try await exploreViewModel.fetchAllUser()
                        try await exploreViewModel.fetchAllPost()
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
                            try await exploreViewModel.fetchAllUser()
                            try await exploreViewModel.fetchAllPost()
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
