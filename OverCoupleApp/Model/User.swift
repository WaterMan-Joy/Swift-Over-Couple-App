//
//  User.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    let username: String
    let email: String
    let profilePic: String
    let bio: String?
    let coupleId: String?
    let couplename: String?
    let couplePic: String?
    var couple: Bool
    
    var isFollowed: Bool? = false
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else {return false}
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "Joy0", email: "sumkim93@jjj.com", profilePic: "over-profile-image", bio: "i am over man", coupleId: "", couplename: "Sunny0", couplePic: "", couple: false),
        .init(id: NSUUID().uuidString, username: "Joy0", email: "sumkim93@jjj.com", profilePic: "over-profile-image", bio: "i am over man", coupleId: "", couplename: "Sunny0", couplePic: "", couple: false),
        .init(id: NSUUID().uuidString, username: "Joy0", email: "sumkim93@jjj.com", profilePic: "over-profile-image", bio: "i am over man", coupleId: "", couplename: "Sunny0", couplePic: "", couple: false),
        .init(id: NSUUID().uuidString, username: "Joy0", email: "sumkim93@jjj.com", profilePic: "over-profile-image", bio: "i am over man", coupleId: "", couplename: "Sunny0", couplePic: "", couple: false),
    ]
}
