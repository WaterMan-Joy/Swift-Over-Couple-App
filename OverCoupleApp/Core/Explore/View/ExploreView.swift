//
//  ExploreView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI

struct ExploreView: View {
    
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
                    
                }) //: SCROLL VIEW
                
            }) //: VSTACK
            .navigationTitle("EXPLORE")
            .navigationBarTitleDisplayMode(.inline)
            
        }) //: NAVIGATION VIEW
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
