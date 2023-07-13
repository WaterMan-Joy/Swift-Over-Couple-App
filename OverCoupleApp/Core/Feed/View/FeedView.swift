//
//  FeedView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(Post.MOCK_POSTS) { post in
                    FeedRowView(username: post.username, caption: post.caption, couplename: post.user?.couplename ?? "none")
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
