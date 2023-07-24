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


class LoginViewModel: ObservableObject {
    
    // view properties
//    @Published var isLogin: Bool = false
    
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = LoginViewModel()
    
    // login status
    enum SignInState {
        case signedIn
        case signedOut
      }
    @Published var state: SignInState = .signedOut
    
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
    func signUpWithGoogle() async throws{
        
        // get app client id
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: ApplicationHelper.rootViewController) {[unowned self]  result, error in
            guard error == nil else {return}
            
            guard let user = result?.user, let idToken = user.idToken?.tokenString else {return}
            print("USER : \(user)")

            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            //[unowned self]
            Auth.auth().signIn(with: credential) { [unowned self] result, error in
                
                // At this point, our user is signed in
                if let err = error {
                    print(err.localizedDescription)
                    return
                } else {
                    print(state)
                }
                
                
                guard let user = result?.user else {return}
                let userData = User(id: user.uid, username: user.displayName ?? "", email: user.email ?? "", profilePic: user.photoURL?.absoluteString ?? "", bio: nil, couplename: nil, couple: false)
                self.currentUser = userData
                guard let encodedUser = try? Firestore.Encoder().encode(userData) else {return}
                Firestore.firestore().collection("users").document(userData.id).setData(encodedUser)
                
//                self.uploadUserData(uid: user.uid, username: user.displayName ?? "", email: user.email ?? "", profilePic: user.photoURL?.absoluteString ?? "")
                self.userSession = result?.user
                state = .signedIn
                print(state)
                print(user)
                print(user.displayName ?? "")
                
            }
        }
    } //: sign in
    
    // sign out
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        do {
            try Auth.auth().signOut()
            self.state = .signedOut
            self.userSession = nil
            self.currentUser = nil
          } catch {
            print(error.localizedDescription)
          }
    }
    
}
