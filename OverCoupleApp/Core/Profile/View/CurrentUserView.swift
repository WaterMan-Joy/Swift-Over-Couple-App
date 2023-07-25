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
//    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username})
    }
    
    var body: some View {
        
        VStack(content: {
            
            // header view
            // user image + couple image
            ZStack(alignment: .top, content: {
                Color(.systemPink)
                    .ignoresSafeArea()
                
                HStack(content: {
                    
                    // user image
                    Image(user.profilePic)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    Text("with")
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                        .padding()
                    if user.couple {
                        // couple image
                        Circle()
                            .frame(width: 100)
                    }
                    else if !user.couple {
                        Image(systemName: "person.fill")
                            .frame(width: 100, height: 100)
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
                        showEditProfile.toggle()
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
                Text("\(user.bio ?? "no bio")")
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
            
            // posts view
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
            EditProfileView()
        })
    }
}

struct CurrentUserView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserView(user: User.MOCK_USERS[0])
    }
}






