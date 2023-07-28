//
//  ProfileView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    @State private var showEditProfile: Bool = false

    @State private var selectedFilter: PostFilterViewModel = .myPosts
//    @Environment(\.presentationMode) var mode
    @Namespace var animation
            
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username})
    }
    
    var body: some View {
        
        VStack(content: {
            // user image + couple image
            ZStack(alignment: .top, content: {
                Color(.systemPink)
                    .ignoresSafeArea()
                
                HStack(content: {
                    
                    // user image
                    CircularProfileImageView(user: user, post: nil, size: CircularProfileImageView.ProfileImageSize.large)
                        
                    Text("with")
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                        .padding()
                    
                    // couple image
                    Circle()
                        .frame(width: 100)
                        .overlay(content: {
                            Text("신청하기")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold, design: .monospaced))
                        })
                })
                .offset(y: -20)
                
            }) //: ZSTACK
            .frame(height: 100)
            
            // user name + is couple? + edit profile + bio
            VStack {
                
                // user name & is couple? & edit profile
                HStack(content: {
                    
                    // user name & is couple?
                    VStack(content: {
                        HStack(content: {
                            // user name
                            Text(user.username)
                                .font(.system(size: 30, weight: .bold, design: .monospaced))
                            // is couple?
                            Image(systemName: "heart.circle")
                                .font(.system(size: 30, weight: .bold, design: .monospaced))
                        }) //: HSTACK / user name & is couple?
                        
                        // user name + couple name
                        VStack(content: {
                            Text("with")
                                .font(.system(size: 20, weight: .bold, design: .monospaced))
                            Text(user.couplename ?? "no couple")
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
                        if user.isCurrentUser {
                            print("show edit profile")
                            self.showEditProfile.toggle()
                        } else {
                            print("follow user")
                        }
                    }, label: {
                        Text(user.isCurrentUser ? "EDIT PROFILE" : "FOLLOW")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(user.isCurrentUser ? .pink : .blue)
                            .cornerRadius(10)
                    }) //: BUTTON / edit profile button
                }) //: HSTACK
                .padding()
                
                // bio
                Text("\(user.bio ?? "no bio")")
                    .font(.system(size: 15, weight: .semibold, design: .monospaced))
                
                Divider()
                
                
            } //: VSTACK / user name + is couple? + edit profile + bio
            
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
            
            ScrollView(showsIndicators: true, content: {
                LazyVStack(content: {
                    ForEach(posts) { post in
                        FeedRowView(post: post)
                    }
                }) //: LAZY VSTACK
            }) //: SCROLL VIEW
            
            Spacer()
            
        }) //: VSTACK
        .fullScreenCover(isPresented: $showEditProfile, content: {
            EditProfileView(user: user)
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[1])
    }
}

