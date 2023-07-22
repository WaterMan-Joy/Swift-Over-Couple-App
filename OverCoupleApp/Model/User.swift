//
//  User.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import Foundation


struct User: Identifiable {
    let id: String
    let username: String
    let email: String
    let profilePic: String
    let bio: String?
    let couplename: String?
    var couple: Bool
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "Joy0", email: "sumkim93@jjj.com", profilePic: "over-profile-image", bio: "i am over man", couplename: "Sunny0", couple: false),
        .init(id: NSUUID().uuidString, username: "Joy1", email: "sumkim93@jjj.com", profilePic: "over-profile-image", bio: "i am over man", couplename: "Sunny1", couple: false),
        .init(id: NSUUID().uuidString, username: "Joy2", email: "sumkim93@jjj.com", profilePic: "over-profile-image", bio: "i am over man", couplename: "Sunny2", couple: false),
        .init(id: NSUUID().uuidString, username: "Joy3", email: "sumkim93@jjj.com", profilePic: "over-profile-image", bio: "i am over man", couplename: "Sunny3", couple: false),
        .init(id: NSUUID().uuidString, username: "Joy4", email: "sumkim93@jjj.com", profilePic: "over-profile-image", bio: "i am over man", couplename: "Sunny4", couple: false),
        .init(id: NSUUID().uuidString, username: "Joy5", email: "sumkim93@jjj.com", profilePic: "over-profile-image", bio: "i am over man", couplename: "Sunny5", couple: false),
        .init(id: NSUUID().uuidString, username: "Joy6", email: "sumkim93@jjj.com", profilePic: "over-profile-image", bio: "i am over man", couplename: "Sunny6", couple: false),
        .init(id: NSUUID().uuidString, username: "Joy7", email: "sumkim93@jjj.com", profilePic: "over-profile-image", bio: "i am over man", couplename: "Sunny7", couple: false),
        .init(id: NSUUID().uuidString, username: "Joy8", email: "sumkim93@jjj.com", profilePic: "over-profile-image", bio: "i am over man", couplename: "Sunny8", couple: false),

    ]
}
