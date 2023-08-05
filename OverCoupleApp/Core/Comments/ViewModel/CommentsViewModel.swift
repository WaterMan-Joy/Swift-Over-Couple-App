//
//  CommentsViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/05.
//

import Foundation
import FirebaseFirestore


class CommentsViewModel: ObservableObject {
    
    private let post: Post
    @Published var comments: [Comment] = [Comment]()
    
    init(post: Post) {
        self.post = post
    }
    
    func uploadComment(commentText: String) {
        guard let user = LoginViewModel.shared.currentUser else {return}
        let postId = post.id
        
        let data: [String : Any] = [
            "uid": user.id,
            "username": user.username,
            "profilePic": user.profilePic,
            "timestamp": Timestamp(),
            "postOwnerUid": post.ownerUid,
            "commentText": commentText,
        ]
        Firestore.firestore().collection("posts").document(postId).collection("post-comments").addDocument(data: data) { error in
            if let error = error {
                print("DEBUG: UPLOAD COMMENT ERROR: \(error.localizedDescription)")
                return
            }
        }
    }
    
    func fetchComments() {
        
    }
}
