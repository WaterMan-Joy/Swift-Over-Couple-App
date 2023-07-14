//
//  FeedView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI

struct FeedView: View {
    
    var body: some View {
        
        // feed view
        NavigationView(content: {
            
            ScrollView {
                
                // feeds view
                LazyVStack {
                    
                    // feed view
                    ForEach(Post.MOCK_POSTS) { post in
                        FeedRowView(username: post.username, caption: post.caption, couplename: post.user?.couplename ?? "none")
                        
                    } //: FOR EACH / feed view
                    
                } //: LAZY VSTACK / feeds view
                
            } //: SCROLL VIEW
            .navigationTitle("FEED")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                
                ToolbarItem(placement: .navigationBarLeading, content: {
                    NavigationLink(destination: {
                        SideMenuView()

                    }, label: {
                        Image(systemName: "list.dash")
                            .font(.system(size: 25, weight: .semibold, design: .monospaced))
                            .foregroundColor(.black)
                    })
                })
                
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        print("arrow.clockwise click!")
                    }, label: {
                        Image(systemName: "arrow.clockwise")
                            .font(.system(size: 25, weight: .semibold, design: .monospaced))
                            .foregroundColor(.black)
                    })
                })
            })
            
        }) //: NAVIGATION VIEW / feed view
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
