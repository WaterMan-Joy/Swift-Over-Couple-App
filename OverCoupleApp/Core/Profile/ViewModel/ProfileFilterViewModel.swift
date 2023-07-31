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
    
    init() {
        Task {
            try await fetchUserPosts()
//            try await fetchUserAndCouplePosts()
        }
    }
    
    @MainActor
    func fetchUserPosts() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let posts = try await PostService.fetchUserPosts(uid: uid)
        self.userPosts = posts
    }
    
    @MainActor
    func fetchUserAndCouplePosts(coupleUid: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
//        let snapshot = Firestore.firestore().collection("users").document(uid)
        
        
        let userAndCouple = try await PostService.fetchUserAndCouplePosts(userUid: uid, coupleUid: coupleUid)
        self.userAndCouplePosts = userAndCouple
        
    }
    
    func removeCouple(coupleId: String) async throws {
        try await CoupleService.removeCouple(coupleId: coupleId)
    }
    
    func addCouple(coupleId: String) async throws {
        try await CoupleService.addCouple(coupleId: coupleId)
    }
}


