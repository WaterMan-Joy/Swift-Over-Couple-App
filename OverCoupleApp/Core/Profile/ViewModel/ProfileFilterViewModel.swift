//
//  ProfileFilterViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/28.
//

import Foundation
import Firebase
import FirebaseFirestore

class ProfileFilterViewModel: ObservableObject {
    
    @Published var userPosts = [Post]()
    @Published var userAndCouplePosts = [Post]()
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchUserPosts()
            try await fetchUserAndCouplePosts()
        }
    }
    
    
    
    @MainActor
    func fetchUserPosts() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let posts = try await PostService.fetchUserPosts(uid: uid)
        self.userPosts = posts
    }
    
    @MainActor
    func fetchUserAndCouplePosts() async throws {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
        let userAndCouple = try await PostService.fetchUserAndCouplePosts()
        self.userAndCouplePosts = userAndCouple
        
    }
    
    func removeCouple() async throws {
        try await CoupleService.removeCouple()
    }
    
    func addCouple(coupleId: String) async throws {
        try await CoupleService.addCouple(coupleId: coupleId)
    }
}


