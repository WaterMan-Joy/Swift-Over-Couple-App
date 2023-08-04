//
//  Post.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import Foundation
import FirebaseFirestore

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
    
    var didLike: Bool? = false
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Over man Joy", likes: 0, imageUrl: "over-image-1", timestamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Over man Joy", likes: 0, imageUrl: "over-image-1", timestamp: Timestamp(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Over man Joy", likes: 0, imageUrl: "over-image-1", timestamp: Timestamp(), user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Over man Joy", likes: 0, imageUrl: "over-image-1", timestamp: Timestamp(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Over man Joy", likes: 0, imageUrl: "over-image-1", timestamp: Timestamp(), user: User.MOCK_USERS[1]),
    ]
}



