//
//  EditProfileViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/25.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase
import FirebaseFirestore

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage)}}
    }
    
    @Published var profileImage: Image?
    
    @Published var username: String = ""
    @Published var bio: String = ""
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        
        self.username = user.username
        
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        var data = [String: Any]()
        
        if let uiImage = uiImage {
            let imageUrl = try await ImageUploader.uploadImage(image: uiImage)
            data["profilePic"] = imageUrl
        }
        
        if !username.isEmpty && user.username != username {
            data["username"] = username
            print("DEBUG: update username \(username)")
        }
        
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
            print("DEBUG: update bio \(bio)")
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
