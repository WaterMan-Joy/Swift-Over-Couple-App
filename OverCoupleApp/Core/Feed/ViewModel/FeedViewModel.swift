//
//  FeedViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/28.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    @Published var user: User

    
    init(user: User) {
        self.user = user
        Task {
            try await fetchPosts()
            try await fetchUser()
        }
    }
    
    @MainActor
    func fetchUser() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        self.user = try snapshot.data(as: User.self)
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
    
    func addCouple(coupleId: String) async throws {
        try await CoupleService.addCouple(coupleId: coupleId)
    }
    
    func removeCouple() async throws {
        try await CoupleService.removeCouple()
    }
    
}
