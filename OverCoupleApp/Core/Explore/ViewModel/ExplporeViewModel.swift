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
}
