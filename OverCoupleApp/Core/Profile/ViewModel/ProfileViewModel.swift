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
        
        UserService.follow(uid: user.id) { _ in
            
            NotificationViewModel.uploadNotification(toUid: self.user.id, type: .follow)
            
            self.user.isFollowed = true
            print("DEBUG: PROFILE VIEW MODEL: FOLLOW \(self.user.username)")
        }
    }
    
    func unFollow() {
        UserService.unFollow(uid: user.id) { _ in
            self.user.isFollowed = false
            print("DEBUG: PROFILE VIEW MODEL: UNFOLLOW")
        }
    }
    
    func checkIfUserIsFollowed() {
        guard !user.isCurrentUser else {return}
        UserService.checkIfUserIsFollowed(uid: user.id) { isFollowed in
            self.user.isFollowed = isFollowed
            print("DEBUG: PROFILE VIEW MODEL: CHECK IF USER IS FOLLOWED")
        }
    }
    
}
