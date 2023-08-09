//
//  Notification.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/07.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore


struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    var postId: String?
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String
    
    var isFollowed: Bool? = false
    var post: Post?
    var user: User?
}

enum NotificationType: Int, Decodable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like: return " 좋아요를 눌렀습니다"
        case .comment: return " 댓글을 달았습니다"
        case .follow: return " 팔로우를 했습니다"
        }
    }
}
