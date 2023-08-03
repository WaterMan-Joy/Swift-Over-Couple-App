//
//  ExplporeViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/25.
//

import Foundation
import FirebaseFirestore

class ExploreViewModel: ObservableObject {
    
    @Published var users: [User] = [User]()
    @Published var posts: [Post] = [Post]()

    init() {
        Task {
            try await fetchAllUser()
            try await fetchAllPost()
        }
    }
    
    @MainActor
    func fetchAllUser() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
    
//    func fetchAllPostUser(postOwnerUid: String) async throws {
//        let snapshot = try await Firestore.firestore().collection("users").document(postOwnerUid).getDocument()
//        let user = try snapshot.data(as: User.self)
//        let uid = user.id
////        let dictionary = snapshot.data()
////        let uid = dictionary?["ownerUid"] as? String ?? ""
//
//    }
    
    
    @MainActor
    func fetchAllPost() async throws {
        self.posts = try await PostService.fetchAllPost()
    }
    
    
    func filteredUser(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({
            $0.username.lowercased().contains(lowercasedQuery)
            
        })
    }
}
