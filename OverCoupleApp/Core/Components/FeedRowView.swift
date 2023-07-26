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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30, content: {
            
            // profile image + user info + feed caption + action buttons
            HStack(alignment: .top, content: {
                FeedUserImageView(post: post)
                
                // user info & feed caption
                VStack(alignment: .leading, content: {
                    
                    // user info
                    HStack(content: {
                        Text(post.user?.username ?? "")
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                        
                        Text("with \(post.user?.couplename ?? "")")
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                            .foregroundColor(.white)
                    }) //: HSTACK user info
                    
                    // feed caption
                    Text(post.caption)
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                }) //: VSTACK user info & feed caption
                .padding(.leading, 10)
                
            }) //: HSTACK profile image + user info + feed caption
            
            // imageu url
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(10)

            
            // action buttons + date
            HStack(content: {
                Text("2 week")
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                    .foregroundColor(Color(.white))
                Button(action: {}, label: {
                    Image(systemName: "text.bubble")
                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
                        .foregroundColor(.black)
                })
                Spacer()
                Text("\(post.likes)")
                Button(action: {}, label: {
                    Image(systemName: "heart")
                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
                        .foregroundColor(.black)
                })
            }) //: HSTACK
            
        }) //: VSTACK
        .frame(maxWidth: .infinity)
        .padding(.all, 30)
        .background(Color(.systemPink))
        .cornerRadius(10)
        .padding(.horizontal)
        
        Divider()
    }
}

struct FeedRowView_Previews: PreviewProvider {
    static var previews: some View {
        FeedRowView(post: Post.MOCK_POSTS[0])
    }
}
