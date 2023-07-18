//
//  FeedView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI

struct FeedView: View {
    
    @State private var showNewPostView: Bool = false
    
    var body: some View {
        
        // feed view
        NavigationView {
            ZStack(alignment: .bottomTrailing, content: {
                
                ScrollView {
                    
                    // feeds view
                    LazyVStack {
                        
                        // feed view
                        ForEach(Post.MOCK_POSTS) { post in
                            FeedRowView(username: post.username, caption: post.caption, couplename: post.user?.couplename ?? "none")
                            
                        } //: FOR EACH / feed view
                        
                    } //: LAZY VSTACK / feeds view
                    
                } //: SCROLL VIEW
                
                // upload view tap
                Button(action: {
                    print("add post button click")
                    self.showNewPostView.toggle()
                }, label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .background(.black)
                        .cornerRadius(50)
                        .padding()
                }) //: BUTTON
                .foregroundColor(.white)
                .fullScreenCover(isPresented: $showNewPostView, content: {
                    UploadPostView()
                })
                
            }) //: ZSTACK
            .navigationTitle("FEED")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                
                ToolbarItem(placement: .navigationBarLeading, content: {
                    NavigationLink(destination: {
                        SideMenuView()

                    }, label: {
                        Image(systemName: "list.dash")
                            .font(.system(size: 20, weight: .semibold, design: .monospaced))
                            .foregroundColor(.black)
                    })
                }) //: TOOL BAR ITEM
                
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        print("arrow.clockwise click!")
                    }, label: {
                        Image(systemName: "arrow.clockwise")
                            .font(.system(size: 20, weight: .semibold, design: .monospaced))
                            .foregroundColor(.black)
                    })
                }) //: TOOL BAR ITEM
            }) //: TOOL BAR
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
