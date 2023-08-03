//
//  UserService.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/21.
//


import Firebase
import FirebaseFirestore

struct UserService {
    
    static func unFollow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = LoginViewModel.shared.userSession?.uid else { return}
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).delete { _ in
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").document(currentUid).delete(completion: completion)
            }
    }
    
    static func follow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = LoginViewModel.shared.userSession?.uid else { return}
        COLLECTION_FOLLOWING.document(currentUid)
            .collection("user-following").document(uid).setData( [:] ) { _ in
                COLLECTION_FOLLOWERS.document(uid)
                    .collection("user-followers").document(currentUid).setData([:], completion: completion)
            }
        
    }

    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({
            try? $0.data(as: User.self)
        })
    }

    static func fetchUser(withUid: String) async throws -> User {
        let snapshot =  try await Firestore.firestore().collection("users").document(withUid).getDocument()
        return try! snapshot.data(as: User.self)
    }


}
