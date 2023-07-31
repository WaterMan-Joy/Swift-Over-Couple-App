//
//  LoginViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/18.
//

import SwiftUI
import Firebase
import GoogleSignIn
import FirebaseFirestoreSwift
import FirebaseFirestore
import FirebaseAuth


class LoginViewModel: ObservableObject {
    
    // view properties
//    @Published var isLogin: Bool = false
    
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = LoginViewModel()
    
    
    
    init() {
        Task {
            try await loadUserData()
        }
    }
    
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else {return}
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        self.currentUser = try? snapshot.data(as: User.self)
    }
    

    // sign in
    @MainActor
    func signUpWithGoogle() throws {
        
        // get app client id
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: ApplicationHelper.rootViewController) { result, error in
            guard error == nil else {return}
            
            guard let user = result?.user, let idToken = user.idToken?.tokenString else {return}
            print("USER : \(user)")

            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            //[unowned self]
            Auth.auth().signIn(with: credential, completion: { result, error  in
                // At this point, our user is signed in
                if let err = error {
                    print(err.localizedDescription)
                    return
                } else {

                }
                guard let user = result?.user else {return}
                let ref = Firestore.firestore().collection("users").document(user.uid)
                Task {
                    let isRef = try await ref.getDocument().exists
                    print("DEBUG: 가입된 유저 입니까? \(isRef)")
                    if !isRef {
                        let userData = User(id: user.uid, username: user.displayName ?? "", email: user.email ?? "", profilePic: user.photoURL?.absoluteString ?? "", bio: "", coupleId: "", couplename: "", couplePic: "", couple: false)
                        self.currentUser = userData
                        guard let encodedUser = try? Firestore.Encoder().encode(userData) else {return}
                        print("DEBUG: \(encodedUser)")
                        try await Firestore.firestore().collection("users").document(userData.id).setData(encodedUser)
                        self.userSession = result?.user
                    }
                }
                Task {
                    try await self.loadUserData()
                }
            })
//            Auth.auth().signIn(with: credential) { result, error in
//
//                // At this point, our user is signed in
//                if let err = error {
//                    print(err.localizedDescription)
//                    return
//                } else {
//
//                }
//                guard let user = result?.user else {return}
//                let ref = Firestore.firestore().collection("users").document(user.uid)
//                let ref2 = try await ref.getDocument().exists
//
//                Task {
//                    let ref2 = try await ref.getDocument().exists
//                    print("DEBUG: aa \(ref2)")
//
//                    if ref2 {
//                        return
//                    }
//                    else {
//
//                    }
//                }
//                let userData = User(id: user.uid, username: user.displayName ?? "", email: user.email ?? "", profilePic: user.photoURL?.absoluteString ?? "", bio: nil, couplename: nil, couple: false)
//                self.currentUser = userData
//                guard let encodedUser = try? Firestore.Encoder().encode(userData) else {return}
//                print("DEBUG: \(encodedUser)")
//                Firestore.firestore().collection("users").document(userData.id).setData(encodedUser, merge: false) { error in
//                    if let err = error {
//                        print("DEBUG: \(err.localizedDescription)")
//                    }
//                    else {
//                        print("DEBUG: 성공")
//                    }
//                }
//                self.userSession = result?.user
//            }
        }
    } //: sign in
    
    
    // sign out
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
          } catch {
            print(error.localizedDescription)
          }
    }
    
}
