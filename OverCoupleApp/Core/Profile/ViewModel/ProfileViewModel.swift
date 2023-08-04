//
//  ProfileViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/02.
//

import Foundation


class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
    }
    
    func follow() {
        print("DEBUG: PROFILE VIEW MODEL: FUNC FOLLOW")
        UserService.follow(uid: user.id) { _ in
            self.user.isFollowed = true
            print("DEBUG: PROFILE VIEW MODEL: FOLLOW \(self.user.username)")
        }
    }
    
    func unFollow() {
        print("DEBUG: PROFILE VIEW MODEL: FUNC UNFOLLOW")
        UserService.unFollow(uid: user.id) { _ in
            self.user.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        guard !user.isCurrentUser else {return}
        UserService.checkIfUserIsFollowed(uid: user.id) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
    
}
