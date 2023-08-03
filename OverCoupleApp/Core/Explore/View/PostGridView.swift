//
//  PostGridView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/02.
//

import SwiftUI
import Kingfisher
import FirebaseFirestore

struct PostGridView: View {
    
    @ObservedObject var exploreViewModel: ExploreViewModel
    
    let posts: [Post]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, content: {
                ForEach(posts, content: { post in
                    NavigationLink(destination: {
                        PostCell(post: post)
                    }, label: {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(10)
                    })
                })
            })
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(exploreViewModel: ExploreViewModel(), posts: Post.MOCK_POSTS)
    }
}
