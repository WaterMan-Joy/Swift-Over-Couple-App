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
    @StateObject var viewModel = ProfileFilterViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30, content: {
            
            // profile image + user info + feed caption + action buttons
            HStack(alignment: .center, content: {
                
                // user profile + user name
                VStack() {
                    
                    // user profile image
                    KFImage(URL(string: post.user?.profilePic ?? ""))
                        .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFill()
                        .cornerRadius(10)
                    
                    // user name
                    Text(post.user?.username ?? "")
                        .font(.system(size: 10))

                } //: VSTACK: USER PROFILE IMAGE + USER NAME
                
                Spacer()
                if post.user?.couple == true {
                    Text("커플")
                        
                }
                Spacer()
                
                // couple profile image + couple name
                VStack() {
                    if post.user?.couple == true {
                        
                        // couple profile image
                        KFImage(URL(string: post.user?.couplePic ?? ""))
                            .resizable()
                            .frame(width: 50, height: 50)
                            .scaledToFill()
                            .cornerRadius(10)
                        
                        // couple name
                        Text(post.user?.couplename ?? "")
                            .font(.system(size: 10))
                        
                    } else if post.user?.couple == false {
                        Image(systemName: "figure.mixed.cardio")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .scaledToFill()
                            .cornerRadius(10)
                        Text("솔로")
                    }
                    
                } //: VSTACK: COUPLE PROFILE IMAGE + COUPLE NAME
                
            }) //: HSTACK profile image + user info + feed caption
            
            // post image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(10)
            
            // feed caption
            Text(post.caption)
                .font(.system(size: 20, weight: .bold, design: .monospaced))

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
            
        }) //: VSTACK
        .font(.system(size: 20, weight: .semibold, design: .monospaced))
        .foregroundColor(Color(.white))
        .frame(maxWidth: .infinity)
        .padding(30)
        .background(Color(.systemPink))
        .cornerRadius(10)
        .padding(.horizontal)
        
        Divider()
    } //: VSTACK / FEED ROW VIEW
}

struct FeedRowView_Previews: PreviewProvider {
    static var previews: some View {
        FeedRowView(post: Post.MOCK_POSTS[0])
    }
}
