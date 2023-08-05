//
//  Comment.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/01.
//

import Foundation
import FirebaseFirestore

struct Comment {
    let id = NSUUID().uuidString
    let username: String
    let postOwnerUid: String
    let profileImageUrl: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String
}



