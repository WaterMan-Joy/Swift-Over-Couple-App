//
//  NotificationCellViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/08.
//

import Foundation

class NotificationCellViewModel: ObservableObject {
    
    @Published var notification: Notification
    
    init(notification: Notification) {
        self.notification = notification
        checkIfUserIsFollowed()
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
}
