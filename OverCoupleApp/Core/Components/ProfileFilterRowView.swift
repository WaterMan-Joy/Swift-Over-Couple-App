//
//  ProfileFilterRowView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/31.
//

import SwiftUI
import Kingfisher

struct ProfileFilterRowView: View {
    
    let post: Post
    
    var body: some View {
        VStack {
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .frame(height: 200)
                .cornerRadius(20)
            HStack {
                Text(post.caption)
                Spacer()
            }
            .padding(.vertical)
            HStack {
                Text("\(post.timestamp.dateValue().formatted())")
                Spacer()
                Text("Likes\(post.likes)")
            }
            .font(.system(size: 10, weight: .bold, design: .monospaced))

            
        }
        .padding()
        .background(.pink)
        .foregroundColor(.white)
        .font(.system(size: 20, weight: .bold, design: .monospaced))
        .frame(maxWidth: .infinity)
        .cornerRadius(20)
        .padding()
    }
}

struct ProfileFilterRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileFilterRowView(post: Post.MOCK_POSTS[0])
    }
}
