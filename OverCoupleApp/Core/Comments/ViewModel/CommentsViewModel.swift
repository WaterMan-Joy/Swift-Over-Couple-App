//
//  CommentsViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/05.
//

import Foundation
import FirebaseFirestore


class CommentsViewModel: ObservableObject {
    
    let post: Post
    @Published var comments = [Comment]()
    
    init(post: Post) {
        self.post = post
        fetchComments()
    }
    
    func uploadComment(commentText: String) {
        guard let user = LoginViewModel.shared.currentUser else {return}
        let postId = post.id
        
        let data: [String : Any] = [
            "uid": user.id,
            "username": user.username,
            "postOwnerUid": post.ownerUid,
            "profileImageUrl": user.profilePic,
            "commentText": commentText,
            "timestamp": Timestamp(),
        ]
        Firestore.firestore().collection("posts").document(postId).collection("post-comments").addDocument(data: data) { error in
            if let error = error {
                print("DEBUG: UPLOAD COMMENT ERROR: \(error.localizedDescription)")
                return
            }
            NotificationViewModel.uploadNotification(toUid: self.post.ownerUid, type: .comment, post: self.post)
        }
    }
    
    func fetchComments() {
        print("DEBUG: COMMENTS VIEW MODEL: FUNC FETCH COMMENTS")
        let postId = post.id
        let query = Firestore.firestore().collection("posts").document(postId).collection("post-comments").order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            guard let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added}) else {return}
            self.comments.append(contentsOf: addedDocs.compactMap({ try? $0.document.data(as: Comment.self)}))
        }
    }
}
