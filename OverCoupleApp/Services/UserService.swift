//
//  UserService.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/21.
//


//import Firebase
//
//struct UserService {
//
//    static func fetchAllUsers() async throws -> [User] {
////        var users: [User] = [User]()
//
//        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
//        return snapshot.documents.compactMap({ try? $0.data(as: User.self)})
////        let documents = snapshot.documents
////
////        for doc in documents {
////            print(doc.data())
////            guard let user = try? doc.data(as: User.self) else { return users }
////            users.append(user)
////        }
////
////        return users
//    }
//
//    static func fetchUser(withUid: String) async throws -> User {
//        let snapshot =  try await Firestore.firestore().collection("users").document(withUid).getDocument()
//        return try! snapshot.data(as: User.self)
//    }
//
//
//}
