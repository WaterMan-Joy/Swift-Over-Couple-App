//
//  PostService.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/28.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

struct PostService {
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        var posts = try snapshot.documents.compactMap({try $0.data(as: Post.self)})
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let query = try await Firestore.firestore().collection("posts").whereField("ownerUid", isEqualTo: uid).getDocuments()
        let posts = try query.documents.compactMap({try $0.data(as: Post.self)})
        return posts
    }
    
    static func fetchUserAndCouplePosts() async throws -> [Post] {
        
        let uid = Auth.auth().currentUser!.uid
        
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        let coupleId = user.coupleId
        
        let userQuery = try await Firestore.firestore().collection("posts").whereField("ownerUid", isEqualTo: uid).getDocuments()
        let userPosts = try userQuery.documents.compactMap({try $0.data(as: Post.self)})
        
        let coupleQuery = try await Firestore.firestore().collection("posts").whereField("ownerUid", isEqualTo: coupleId ?? "").getDocuments()
        let couplePosts = try coupleQuery.documents.compactMap({try $0.data(as: Post.self)})
        
        let userAndCouplePosts = userPosts + couplePosts
        return userAndCouplePosts
    }
}
