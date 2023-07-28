//
//  ProfileFilterViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/28.
//

import Foundation
import Firebase

class ProfileFilterViewModel: ObservableObject {
    
    @Published var userPosts = [Post]()
    
    init() {
        Task {
            try await fetchUserPosts()
        }
    }
    
    @MainActor
    func fetchUserPosts() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let posts = try await PostService.fetchUserPosts(uid: uid)
        self.userPosts = posts
    }
}
