//
//  ProfileView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var selectedFilter: PostFilterViewModel = .myPosts
//    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    var body: some View {
        
        VStack(content: {
            
            // header view
            HeaderView()
            
            // user info details
            UserInfoDetails(username: User.MOCK_USERS[0].username, couplename: User.MOCK_USERS[0].couplename ?? "None", bio: User.MOCK_USERS[0].bio)
            
            // post filter bar
            postFilterBar
            
            // posts view
            PostsView()
            
            
            Spacer()
            
        }) //: VSTACK
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

// header view
struct HeaderView: View {
    var body: some View {
        // user image + couple image
        ZStack(alignment: .top, content: {
            Color(.systemPink)
                .ignoresSafeArea()
            
            HStack(content: {
                
                // user image
                Circle()
                    .frame(width: 100)
                Text("with")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                    .padding()
                
                // couple image
                Circle()
                    .frame(width: 100)
            })
            .offset(y: -20)
            
        }) //: ZSTACK
        .frame(height: 100)
    }
}

// userInfo details
struct UserInfoDetails: View {
    
    let username: String
    let couplename: String
    let bio: String
    
    var body: some View {
        // user name + is couple? + edit profile + bio
        VStack {
            
            // user name & is couple? & edit profile
            HStack(content: {
                
                // user name & is couple?
                VStack(content: {
                    HStack(content: {
                        // user name
                        Text(username)
                            .font(.system(size: 30, weight: .bold, design: .monospaced))
                        // is couple?
                        Image(systemName: "heart.circle")
                            .font(.system(size: 30, weight: .bold, design: .monospaced))
                    }) //: HSTACK / user name & is couple?
                    
                    // user name + couple name
                    VStack(content: {
                        Text("with")
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                        Text(couplename)
                            .font(.system(size: 25, weight: .bold, design: .monospaced))
                        Image(systemName: "heart.circle")
                            .font(.system(size: 30, weight: .bold, design: .monospaced))
                    }) //: VSTACK / user name + couple name
                }) //: VSTACK / user name & is couple?
                
                Image(systemName: "mappin.circle")
                    .font(.system(size: 30, weight: .bold, design: .monospaced))
                    .foregroundColor(.pink)
                
                Spacer()
                
                // edit profile
                Button(action: {
                    print("edit profile")
                }, label: {
                    Text("EDIT PROFILE")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(.pink)
                        .cornerRadius(10)
                }) //: BUTTON / edit profile button
            }) //: HSTACK
            .padding()
            
            // bio
            Text("\(bio)")
                .font(.system(size: 15, weight: .semibold, design: .monospaced))
            
            Divider()
            
            
        } //: VSTACK / user name + is couple? + edit profile + bio
    }
}

// posts view
struct PostsView: View {
    var body: some View {
        ScrollView(showsIndicators: true, content: {
            LazyVStack(content: {
                ForEach(Post.MOCK_POSTS) { post in
                    FeedRowView(username: post.username, caption: post.caption, couplename: post.user?.couplename ?? "None")
                }
            }) //: LAZY VSTACK
        }) //: SCROLL VIEW
    }
}

extension ProfileView {
    // post filter bar
    var postFilterBar: some View {
        
        // my posts & our posts & like posts
        HStack(content: {
            ForEach(PostFilterViewModel.allCases, id: \.rawValue, content: { item in
                
                Spacer()
                VStack(content: {
                    Text(item.title)
                        .font(.system(size: 20, weight: selectedFilter == item ? .semibold : .regular, design: .monospaced))
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(.black)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }
                    else {
                        Capsule()
                            .foregroundColor(.clear)
                            .frame(height: 3)
                        
                    }
                })
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
                Spacer()
            }) //: FOREACH
        }) //: HSTACK / my posts & our posts & like posts
    }
}

