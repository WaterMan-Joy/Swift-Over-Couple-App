//
//  PostCell.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/02.
//

import SwiftUI
import Kingfisher

struct PostCell: View {
    
    let post: Post
    
    var body: some View {
        VStack {
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .frame(maxWidth: .infinity)
                .scaledToFit()
            
            Text(post.caption)
                .font(.system(size: 30, weight: .semibold, design: .monospaced))
            
            HStack {
                Text(post.timestamp.dateValue().formatted())
                Spacer()
                Text("\(post.likes)")
            }
            .padding()
            
            Spacer()
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post.MOCK_POSTS[0])
    }
}
