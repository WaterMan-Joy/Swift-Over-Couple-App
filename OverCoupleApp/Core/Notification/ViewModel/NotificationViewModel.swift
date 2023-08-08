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
    @Published var notificationsCount: Int = 0
    
    init() {
        fetchNotifications()
        Task {
            try await notificationsCount()
        }
    }
    
    @MainActor
    func notificationsCount() async throws {
        guard let user = LoginViewModel.shared.currentUser else {return}
        let snapshot = try await Firestore.firestore().collection("notifications").document(user.id).collection("user-notifications").getDocuments()
        print(snapshot.count)
        self.notificationsCount = snapshot.count
        
    }
    
    func fetchNotifications() {
        guard let user = LoginViewModel.shared.currentUser else {return}
        let query = Firestore.firestore().collection("notifications").document(user.id).collection("user-notifications").order(by: "timestamp", descending: true)
        
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            self.notifications = documents.compactMap({ try? $0.data(as: Notification.self)})
        }
    }
    
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

