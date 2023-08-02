//
//  FeedView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI
import GoogleSignIn

struct FeedView: View {
    
    let user: User
    
    @StateObject private var feedViewModel = FeedViewModel()
    @State private var showNewPostView: Bool = false
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        
        // feed view
        NavigationView {
            ZStack(alignment: .bottomTrailing, content: {
                
                ScrollView {
                    
                    // feeds view
                    LazyVStack {
                        
                        // feed view
                        ForEach(feedViewModel.posts) { post in
                            NavigationLink(destination: {
                                FeedInfoView(post: post, users: feedViewModel.users)
                                
                            }, label: {
                                FeedRowView(post: post, user: user)
                            })

                        } //: FOR EACH / feed view
                        
                    } //: LAZY VSTACK / feeds view
                    
                } //: SCROLL VIEW
                .refreshable {
                    Task {
                        try await feedViewModel.fetchPosts()
                    }
                }
                
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
            .navigationTitle("\(user.username)님의 피드")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                
                ToolbarItem(placement: .navigationBarLeading, content: {
                    NavigationLink(destination: {
                        SideMenuView(user: user)
                            .environmentObject(viewModel)

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
        FeedView(user: User.MOCK_USERS[0])
    }
}
