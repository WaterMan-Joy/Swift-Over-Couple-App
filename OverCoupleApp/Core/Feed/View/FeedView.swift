//
//  FeedView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI
import GoogleSignIn
import Kingfisher

struct FeedView: View {
    
    // 프로퍼티
    let user: User
    
    // VM
    @ObservedObject var feedViewModel = FeedViewModel(user: User.MOCK_USERS[0])
    @EnvironmentObject var viewModel: ContentViewModel
    
    // STATE
    @State private var showNewPostView: Bool = false
    
    // INIT
    init(user: User) {
        self.user = user
        self.feedViewModel = FeedViewModel(user: user)
    }
    
    // BODY
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
                                FeedInfoView(post: post, viewModel: feedViewModel)
                                
                            }, label: {
                                FeedCellView(feedCellViewModel: FeedCellViewModel(post: post))
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
            .navigationTitle("OVER COUPLE")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                
                ToolbarItem(placement: .navigationBarLeading, content: {
                    NavigationLink(destination: {
                        SideMenuView(user: user)
                            .environmentObject(viewModel)

                    }, label: {
                        KFImage(URL(string: user.profilePic))
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())

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
