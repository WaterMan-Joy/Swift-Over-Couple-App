//
//  NotificationCellViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/08.
//

import Foundation
import FirebaseFirestore

class NotificationCellViewModel: ObservableObject {
    
    @Published var notification: Notification
    
    init(notification: Notification) {
        self.notification = notification
        checkIfUserIsFollowed()
        fetchNotificationPost()
        fetchNotificationUser()
    }
    
    func follow() {
        UserService.follow(uid: notification.uid) { _ in
            NotificationViewModel.uploadNotification(toUid: self.notification.uid, type: .follow)
            self.notification.isFollowed = true
        }
    }
    
    func unFollow() {
        UserService.unFollow(uid: notification.uid) { _ in
            self.notification.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        guard notification.type == .follow else {return}
        UserService.checkIfUserIsFollowed(uid: notification.uid) { isFollowed in
            self.notification.isFollowed = isFollowed
        }
    }
    
    func fetchNotificationPost() {
        print("DEBUG: NOTIFICATION CELL VIEW MODEL: FETCH NOTIFICATION POST")
        guard let postId = notification.postId else {return}
        Firestore.firestore().collection("posts").document(postId).getDocument { snapshot, _ in
            self.notification.post = try? snapshot?.data(as: Post.self)
        }
    }
    
    func fetchNotificationUser() {
        print("DEBUG: NOTIFICATION CELL VIEW MODEL: FETCH NOTIFICATION USER")
        Firestore.firestore().collection("users").document(notification.uid).getDocument { snapshot, _ in
            self.notification.user = try? snapshot?.data(as: User.self)
        }
    }
}
