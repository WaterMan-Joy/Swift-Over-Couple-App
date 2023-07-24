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
        self.userSession = Auth.auth().currentUser
    }
    
    func loadUserData() async throws {
//            self.userSession = Auth.auth().currentUser
//            guard let currentUid = userSession?.uid else {return}
//            self.currentUser = try await UserService.fetchUser(withUid: currentUid)

        }
    
    private func uploadUserData(uid: String, username: String, email: String, profilePic: String) async {
        let user = User(id: uid, username: username, email: email, profilePic: profilePic, bio: nil, couplename: nil, couple: false)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
        
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
    
    // sign in
    func signUpWithGoogle() {
        
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
            Auth.auth().signIn(with: credential) {[unowned self] result, error in
                
                // At this point, our user is signed in
                if let err = error {
                    print(err.localizedDescription)
                    return
                } else {
                    print(state)
                }
                
                
                guard let user = result?.user else {return}
                let userData = User(id: user.uid, username: user.displayName ?? "", email: user.email ?? "", profilePic: user.photoURL?.absoluteString ?? "", bio: nil, couplename: nil, couple: false)
                guard let encodedUser = try? Firestore.Encoder().encode(userData) else {return}
                Firestore.firestore().collection("users").document(userData.id).setData(encodedUser)
//                self.uploadUserData(uid: user.uid, username: user.displayName ?? "", email: user.email ?? "", profilePic: user.photoURL?.absoluteString ?? "")
                self.userSession = result?.user
                state = .signedIn
                print(state)
                print(user)
                print(user.displayName ?? "")
                print(user.email ?? "")
                print(user.photoURL ?? "")
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
          } catch {
            print(error.localizedDescription)
          }
    }
    
}
