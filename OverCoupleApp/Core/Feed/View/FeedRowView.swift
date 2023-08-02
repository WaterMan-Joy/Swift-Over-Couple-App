//
//  FeedRowVIew.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI
import Kingfisher

struct FeedRowView: View {
    
    let post: Post
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30, content: {
            
            // profile image + user info + action buttons
            HStack(alignment: .center, content: {

                // user profile + user name
                VStack() {

                    // user profile image
                    KFImage(URL(string: user.profilePic))
                        .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFill()
                        .clipShape(Circle())

                    // user name
                    Text(user.username)
                        .font(.system(size: 10))

                } //: VSTACK: USER PROFILE IMAGE + USER NAME

                Spacer()
                if user.couple == true {
                    Text("커플")

                }
                Spacer()

                // couple profile image + couple name
                VStack() {
                    if user.couple == true {

                        // couple profile image
                        KFImage(URL(string: user.couplePic ?? ""))
                            .resizable()
                            .frame(width: 50, height: 50)
                            .scaledToFill()
                            .clipShape(Circle())

                        // couple name
                        Text(user.couplename ?? "")
                            .font(.system(size: 10))

                    } else if user.couple == false {
                        Image(systemName: "figure.mixed.cardio")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .scaledToFill()
                            .cornerRadius(10)
                        Text("솔로")
                    }

                } //: VSTACK: COUPLE PROFILE IMAGE + COUPLE NAME

            }) //: HSTACK profile image + user info + feed caption
            .padding(.horizontal)
            .padding(.top)
            
            // post image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                
            
            VStack(alignment: .leading) {
                // feed caption
                Text(post.caption)
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .padding(.bottom, 20)

                // action buttons + date
                HStack(content: {
                    
                    // date
                    Text("\(post.timestamp.dateValue().formatted())")
                        .font(.system(size: 15))
                    Spacer()

                    // comments button
                    Button(action: {
                        print("FEED ROW VIEW: CLICK COMMENT")
                    }, label: {
                        Image(systemName: "text.bubble")
                            
                    }) //: COMMENTS BUTTON
                    
                    Text("\(post.likes)")
                    // likes button
                    Button(action: {
                        print("FEED ROW VIEW: CLICK LIKES")
                    }, label: {
                        Image(systemName: "heart")
                            
                    }) //: LIKES BUTTON
                    
                }) //: HSTACK
            } //: VSTACK
            .padding(.horizontal)
            .padding(.bottom)
            
        }) //: VSTACK
        .font(.system(size: 20, weight: .semibold, design: .monospaced))
        .foregroundColor(.black)
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
        .padding()
        
        
    } //: VSTACK / FEED ROW VIEW
}

struct FeedRowView_Previews: PreviewProvider {
    static var previews: some View {
        FeedRowView(post: Post.MOCK_POSTS[0], user: User.MOCK_USERS[0])
    }
}
