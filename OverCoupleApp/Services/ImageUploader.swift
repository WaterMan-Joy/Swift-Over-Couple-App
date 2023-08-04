//
//  ImageUploader.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/25.
//

import Foundation
import SwiftUI
import FirebaseStorage

enum UploadType {
    case profile
    case post
    
    var filePath: StorageReference {
        let filename = NSUUID().uuidString
        switch self {
        case .profile:
            return Storage.storage().reference(withPath: "/profile_images/\(filename)")
        case .post:
            return Storage.storage().reference(withPath: "/post_images/\(filename)")
        }
    }
}

class ImageUploader {
    static func uploadImage(image: UIImage, type: UploadType) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return nil}
//        let filename = NSUUID().uuidString
//        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        let ref = type.filePath
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: failed to upload image with error \(error.localizedDescription)")
            return nil
        }
    }
}
