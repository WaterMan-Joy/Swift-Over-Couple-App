//
//  NotificationViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/07.
//

import Foundation
import FirebaseFirestore

class NotificationViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    func fetchNotifications() {}
    
    static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let user = LoginViewModel.shared.currentUser else {return}
        
        var data: [String: Any] = [
            "username": user.username,
            "profileImageUrl": user.profilePic,
            "timestamp": Timestamp(date: Date()),
            "type": type.rawValue,
            "uid": user.id,
        ]
        if let postId = post?.id {
            data["postId"] = postId
        }
        
        // COLLECTION_NOTIFICATIONS
        Firestore.firestore().collection("notifications").document(uid).collection("user-notifications").addDocument(data: data)
    }
}

