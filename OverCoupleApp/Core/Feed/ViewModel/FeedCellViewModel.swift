//
//  FeedCellViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/04.
//

// print("DEBUG: FEED CELL VIEW MODEL:")

import Foundation
import FirebaseFirestore

class FeedCellViewModel: ObservableObject {
    
    @Published var post: Post
    
    @Published var postCount: Int = 0
    
    var likeString: String {
        let label = post.likes == 0 ? "like" : "likes"
        return "\(post.likes) \(label)"
    }
    
    init(post: Post) {
        self.post = post
        checkIfUserLikedPost()
        Task {
            try await postCount()
        }
    }
    
    @MainActor
    func postCount() async throws {
        let postId = post.id
        let doc = try await Firestore.firestore().collection("posts").document(postId).collection("post-comments").getDocuments()
        self.postCount = doc.count
        print("DEBUG: FEED CELL VIEW MODEL: POST COUNT \(doc.count)")
    }
    
    func like() {
        print("DEBUG: FEED CELL VIEW MODEL: LIKE")
        guard let uid = LoginViewModel.shared.userSession?.uid else {return}
        let postId = post.id
        
        Firestore.firestore().collection("posts").document(postId).collection("post-likes").document(uid).setData( [ : ] ) { _ in
            Firestore.firestore().collection("users").document(uid).collection("user-likes").document(postId).setData([ : ]) { _ in
                Firestore.firestore().collection("posts").document(postId).updateData(["likes" : self.post.likes + 1])
                
                NotificationViewModel.uploadNotification(toUid: self.post.ownerUid, type: .like, post: self.post)
                
                self.post.didLike = true
                self.post.likes += 1
            }
        }
    }
    
    func unLike() {
        print("DEBUG: FEED CELL VIEW MODEL: UNLIKE")
        guard post.likes > 0 else {return}
        guard let uid = LoginViewModel.shared.userSession?.uid else {return}
        let postId = post.id
        
        Firestore.firestore().collection("posts").document(postId).collection("post-likes").document(uid).delete { _ in
            Firestore.firestore().collection("users").document(uid).collection("user-likes").document(postId).delete { _ in
                Firestore.firestore().collection("posts").document(postId).updateData(["likes" : self.post.likes - 1])
                self.post.didLike = false
                self.post.likes -= 1
            }
        }
    }
    
    func checkIfUserLikedPost() {
        print("DEBUG: FEED CELL VIEW MODEL: CHECK LIKES")
        guard let uid = LoginViewModel.shared.userSession?.uid else {return}
        let postId = post.id
        
        Firestore.firestore().collection("users").document(uid).collection("user-likes").document(postId).getDocument { Snapshot, _ in
            guard let didLike = Snapshot?.exists else {return}
            self.post.didLike = didLike
        }
    }
}
