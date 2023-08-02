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
    @Published var users = [User]()
    @Published var user: User?
    
    init() {
        Task {
            try await fetchPosts()
            try await fetchAllUsers()
            try await fetchUser()
        }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = try snapshot.documents.compactMap({ try $0.data(as: User.self)})
        self.users = users
    }
    
    @MainActor
    func fetchUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.user = user
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
