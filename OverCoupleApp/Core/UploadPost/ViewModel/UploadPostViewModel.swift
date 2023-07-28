//
//  UploadPostViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/22.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {Task {await loadImage(fromItem: selectedImage)}}
    }
    
    @Published var profileImage: Image?
    private var uiImage: UIImage?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
//        if let item = item {
//            if let data = try? await item.loadTransferable(type: Data.self) {
//                if let uiImage = UIImage(data: data) {
//                    self.uiImage = uiImage
//                    self.profileImage = Image(uiImage: uiImage)
//                } else {
//                    print("DEBUG: UPLOAD POST VIEWMODEL: NO UIIMAGE")
//                }
//            } else {
//                print("DEBUG: UPLOAD POST VIEWMODEL: NO DATA")
//            }
//        } else {
//            print("DEBUG: UPLOAD POST VIEWMODEL: NO ITEM")
//        }
        
        guard let item = item else { return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        //
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let uiImage = uiImage else {return}
        
        let postRef = Firestore.firestore().collection("posts").document()
        
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else {return}
        let post = Post(id: postRef.documentID, ownerUid: uid, caption: caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else {return}
        try await postRef.setData(encodedPost)
        
    }
}
