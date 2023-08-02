//
//  ExplporeViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/25.
//

import Foundation


class ExploreViewModel: ObservableObject {
    
    @Published var users: [User] = [User]()
    
    init() {
        Task {
            try await fetchAllUser()
        }
    }
    
    @MainActor
    func fetchAllUser() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
    
    func filteredUser(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({
            $0.username.lowercased().contains(lowercasedQuery)
            
        })
    }
}
