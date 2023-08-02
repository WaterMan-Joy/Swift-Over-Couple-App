//
//  CoupleService.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/30.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class CoupleService {
    
    static func removeCouple() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        let coupleID = user.coupleId!
        
        let snapshot2 = try await Firestore.firestore().collection("users").document(coupleID).getDocument()
        let couple = try snapshot2.data(as: User.self)
        
        if user.couplename == couple.username && couple.couplename == user.username {
            let userData = User(id: user.id, username: user.username, email: user.email, profilePic: user.profilePic, bio: user.bio, coupleId: "", couplename: "", couplePic: "", couple: false)
            let coupleData = User(id: couple.id, username: couple.username, email: couple.email, profilePic: couple.profilePic, bio: couple.bio, coupleId: "", couplename: "", couplePic: "", couple: false)
            
            guard let encodedUser = try? Firestore.Encoder().encode(userData) else {return}
            guard let encodedCouple = try? Firestore.Encoder().encode(coupleData) else {return}
            try await Firestore.firestore().collection("users").document(userData.id).setData(encodedUser)
            try await Firestore.firestore().collection("users").document(coupleData.id).setData(encodedCouple)
            
        }
        else {
            print("커플해제를 할 수 없습니다")
        }
    }
    
    static func addCouple(coupleId: String) async throws {
        
        // current uid
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        // user
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        
        // couple
        let snapshot2 = try await Firestore.firestore().collection("users").document(coupleId).getDocument()
        let couple = try snapshot2.data(as: User.self)
        
        if user.couple == false && couple.couple == false {
            let userData = User(id: user.id, username: user.username, email: user.email, profilePic: user.profilePic, bio: user.bio, coupleId: couple.id, couplename: couple.username, couplePic: couple.profilePic, couple: true)
            let coupleData = User(id: couple.id, username: couple.username, email: couple.email, profilePic: couple.profilePic, bio: couple.bio, coupleId: user.id, couplename: user.username, couplePic: user.profilePic, couple: true)
            
            
            guard let encodedUser = try? Firestore.Encoder().encode(userData) else {return}
            guard let encodedCouple = try? Firestore.Encoder().encode(coupleData) else {return}
            try await Firestore.firestore().collection("users").document(userData.id).setData(encodedUser)
            try await Firestore.firestore().collection("users").document(coupleData.id).setData(encodedCouple)
        }
        else {
            print("커플이 될수 없습니다")
        }
    }
    
}
