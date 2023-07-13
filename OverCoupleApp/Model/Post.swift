//
//  Post.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import Foundation
import SwiftUI

struct Post: Identifiable {
    let id: String
    let username: String
    let caption: String
    var likes: Int
    let imageUrl: String
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, username: "Joy", caption: "Over man Joy", likes: 0, imageUrl: "", user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, username: "Joy", caption: "Over man Joy", likes: 0, imageUrl: "", user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, username: "Joy", caption: "Over man Joy", likes: 0, imageUrl: "", user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, username: "Joy", caption: "Over man Joy", likes: 0, imageUrl: "", user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, username: "Joy", caption: "Over man Joy", likes: 0, imageUrl: "", user: User.MOCK_USERS[0]),
    ]
}



