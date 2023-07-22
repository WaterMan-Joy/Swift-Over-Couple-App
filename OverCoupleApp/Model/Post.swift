//
//  Post.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import Foundation

struct Post: Identifiable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Over man Joy", likes: 0, imageUrl: "over-image-1", timestamp: Date(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Over man Joy", likes: 0, imageUrl: "over-image-1", timestamp: Date(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Over man Joy", likes: 0, imageUrl: "over-image-1", timestamp: Date(), user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Over man Joy", likes: 0, imageUrl: "over-image-1", timestamp: Date(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Over man Joy", likes: 0, imageUrl: "over-image-1", timestamp: Date(), user: User.MOCK_USERS[1]),
    ]
}



