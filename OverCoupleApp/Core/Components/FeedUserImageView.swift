//
//  FeedUserImageView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/26.
//

import SwiftUI
import Kingfisher

struct FeedUserImageView: View {
    let post: Post
    var body: some View {
        KFImage(URL(string: post.user?.profilePic ?? ""))
            .resizable()
            .scaledToFit()
            .frame(width: 60, height: 60)
            .clipShape(Circle())
    }
}

struct FeedUserImageView_Previews: PreviewProvider {
    static var previews: some View {
        FeedUserImageView(post: Post.MOCK_POSTS[0])
    }
}
