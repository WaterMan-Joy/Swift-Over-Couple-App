//
//  User.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import Foundation


struct User {
    let id: String
    let username: String
    let bio: String
    let couplename: String?
    var couple: Bool
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "Joy", bio: "i am over man", couplename: "Sunny", couple: false),
        .init(id: NSUUID().uuidString, username: "Joy", bio: "i am over", couplename: "Sunny", couple: true),
    ]
}
