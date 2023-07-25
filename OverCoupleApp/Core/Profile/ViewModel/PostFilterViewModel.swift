//
//  PostFilterViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import Foundation
import PhotosUI
import SwiftUI


enum PostFilterViewModel: Int, CaseIterable {
    case myPosts
    case ourPosts
    case likePosts
    
    var title: String {
        switch self {
        case .myPosts: return "MY POSTS"
        case .ourPosts: return "OUR POSTS"
        case .likePosts: return "LIKE POSTS"
        }
    }
}


