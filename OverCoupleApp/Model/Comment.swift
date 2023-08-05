//
//  Comment.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/01.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Comment: Identifiable, Hashable, Codable {
    @DocumentID var id: String?
    let username: String
    let postOwnerUid: String
    let profileImageUrl: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String
}



