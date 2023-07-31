//
//  FeedViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/28.
//

import Foundation
import Firebase
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
        self.posts = try await PostService.fetchFeedPosts()
    }
    
    func addCouple(coupleId: String) async throws {
        try await CoupleService.addCouple(coupleId: coupleId)
    }
    
    func removeCouple(coupleId: String) async throws {
        try await CoupleService.removeCouple(coupleId: coupleId)
    }
    
}
