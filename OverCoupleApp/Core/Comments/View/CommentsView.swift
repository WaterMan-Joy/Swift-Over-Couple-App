//
//  CommentsVIew.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/05.
//

import SwiftUI

struct CommentsView: View {
    
    @State var commentText: String = ""
    
    @ObservedObject var commentsViewModel: CommentsViewModel
    
    init(post: Post) {
        self.commentsViewModel = CommentsViewModel(post: post)
    }
    
    
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(0 ..< 10) { _ in
                        CommentsCell()
                        Divider()
                    }
                }
                CustomInput(inputText: $commentText, action: {
                    print("COMMENTS VIEW: CLICK CUSTOM INPUT BUTTON")
                    uploadComment()
                })
                Spacer()
            }
        }
    }
    
    func uploadComment() {
        commentsViewModel.uploadComment(commentText: commentText)
        commentText = ""
    }
    
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(post: Post.MOCK_POSTS[0])
    }
}
