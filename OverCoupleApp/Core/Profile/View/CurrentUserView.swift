//
//  CurrentUserView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/20.
//

import SwiftUI

struct CurrentUserView: View {
    
    let user: User
    @State private var showEditProfile: Bool = false

    @State private var selectedFilter: PostFilterViewModel = .myPosts
    @Namespace var animation
    
    @StateObject private var viewModel = ProfileFilterViewModel()
    
    var body: some View {
        
        VStack(content: {
            
            // header view
            // user image + couple image
            ZStack(alignment: .top, content: {
                Color(.systemPink)
                    .ignoresSafeArea()
                
                HStack(content: {
                    
                    // user image
                    
                    if user.couple {
                        CircularProfileImageView(user: user, post: nil, size: .large)
                        Text("WITH")
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                            .foregroundColor(.white)
                            .padding()
                        Circle().frame(width: 50)
                    } else if !user.couple {
                        CircularProfileImageView(user: user, post: nil, size: .large)
                    }
                    
                })
                .offset(y: -20)
                
            }) //: ZSTACK
            .frame(height: 100)
            
            // user info details
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
                                .foregroundColor(.pink)
                                .font(.system(size: 30, weight: .bold, design: .monospaced))
                        }) //: HSTACK / user name & is couple?
                        
                        // user name + couple name
                        VStack(content: {
                            Text("\(user.couple ? "WITH" : "")")
                                .font(.system(size: 20, weight: .bold, design: .monospaced))
                            Text(user.couple ? user.couplename ?? "" : "빛나는 솔로") 
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
                        showEditProfile.toggle()
                    }, label: {
                        Text("프로필 수정")
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
                Text("\(user.bio ?? "설명 없음")")
                    .font(.system(size: 15, weight: .semibold, design: .monospaced))
                
                Divider()
                
                
            } //: VSTACK / user name + is couple? + edit profile + bio
            
            // post filter bar
            // my posts & our posts & like posts
            HStack(content: {
                ForEach(PostFilterViewModel.allCases, id: \.rawValue, content: { item in
                    
                    Spacer()
                    VStack(content: {
                        Text(item.title)
                            .font(.system(size: 15, weight: selectedFilter == item ? .semibold : .regular, design: .monospaced))
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
            
            // posts view
            ScrollView(showsIndicators: true, content: {
                LazyVStack(content: {
                    if PostFilterViewModel.myPosts == selectedFilter {
                        ForEach(viewModel.userPosts) { post in
                            FeedRowView(post: post)
                        }
                    }
                    else if PostFilterViewModel.ourPosts == selectedFilter{
                        ForEach(viewModel.userAndCouplePosts) { post in
                            FeedRowView(post: post)
                        }
                    } else if PostFilterViewModel.likePosts == selectedFilter{
                        Text("좋아한 포스트")
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

struct CurrentUserView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserView(user: User.MOCK_USERS[0])
    }
}






