//
//  ProfileView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    let user: User
    @State private var showEditProfile: Bool = false

    @State private var selectedFilter: PostFilterViewModel = .myPosts
    @Namespace var animation
    @StateObject private var viewModel = ProfileFilterViewModel()

            
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username})
    }
    
    
    var body: some View {
        
        VStack(content: {
            // user image + couple image
            ZStack(alignment: .top, content: {
                Color(.systemPink)
                    .ignoresSafeArea()
                
                // user image + couple image
                HStack(content: {
                    
                    // user image
                    KFImage(URL(string: user.profilePic))
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                    
                    // couple?
                    if user.couple == true {
                        Image(systemName: "heart.circle")
                            .font(.system(size: 40))
                    }
                    
                    // couple image
                    KFImage(URL(string: user.couplePic ?? ""))
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                    
                })
                .fontDesign(.monospaced)
                .foregroundColor(.white)
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
                            Text(user.couplename ?? "솔로")
                                .font(.system(size: 25, weight: .bold, design: .monospaced))
                            Image(systemName: "heart.circle")
                                .font(.system(size: 30, weight: .bold, design: .monospaced))
                        }) //: VSTACK / user name + couple name
                    }) //: VSTACK / user name & is couple?
                    
                    Image(systemName: "mappin.circle")
                        .font(.system(size: 30, weight: .bold, design: .monospaced))
                        .foregroundColor(.pink)
                    
                    Spacer()
                    
                    // edit profile + follow
                    Button(action: {
                        if user.isCurrentUser {
                            print("PROFILE VIEW: CLICK EDIT BUTTON")
                            self.showEditProfile.toggle()
                        } else {
                            print("PROFILE VIEW: CLICK FOLLOW BUTTON")
                        }
                    }, label: {
                        Text(user.isCurrentUser ? "프로필 수정" : "팔로우")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(user.isCurrentUser ? .pink : .blue)
                            .cornerRadius(10)
                        
                    }) //: BUTTON: EDIT PROFILE BUTTON OR FOLLOW BUTTON
                    
                }) //: HSTACK
                .padding()
                
                // bio
                Text("설명")
                    .font(.system(size: 15, weight: .semibold, design: .monospaced))
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
                            .font(.system(size: 18, weight: selectedFilter == item ? .semibold : .regular, design: .monospaced))
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
                    if PostFilterViewModel.myPosts == selectedFilter {
                        ForEach(viewModel.userPosts) { post in
                            ProfileFilterRowView(post: post)
                        }
                    }
                    else if PostFilterViewModel.ourPosts == selectedFilter{
                        ForEach(viewModel.userAndCouplePosts) { post in
                            ProfileFilterRowView(post: post)
                        }
                    } else if PostFilterViewModel.likePosts == selectedFilter{
                        Text("좋아한 포스트")
                    }
                    
                }) //: LAZY VSTACK
            }) //: SCROLL VIEW
            .refreshable {
                Task {
                    try await viewModel.fetchUserPosts()
                    try await viewModel.fetchUserAndCouplePosts()
                }
            }
            
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

