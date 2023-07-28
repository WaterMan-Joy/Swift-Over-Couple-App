//
//  FeedViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/28.
//

import Foundation
import FirebaseFirestore

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task {
            try await fetchPosts()
        }
    }
    
    @MainActor
    func fetchPosts() async throws {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts = try snapshot.documents.compactMap({try $0.data(as: Post.self)})
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            self.posts[i].user = postUser
        }
        
        
        /*
        self.posts = try snapshot.documents.compactMap({ doc in
            let post = try doc.data(as: Post.self)
            return post
        })
        */
                
        
//        do {
//            let snapshot = try? await Firestore.firestore().collection("posts").getDocuments(
//            if let snapshot {
//                self.posts = try snapshot.documents.compactMap({ doc in
//                    let post = try doc.data(as: Post.self)
//                    return post
//                })
//            } else {
//                print("DEBUG: FEED VIEW MODEL: ERR SNAPSHOT")
//            }
//        } catch let err {
//            print("DEBUG: FEED VIEW MODEL: FUNC FETCH POSTS \(err.localizedDescription)")
//        }
         
        
    }
}
