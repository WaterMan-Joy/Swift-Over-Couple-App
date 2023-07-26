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
        case .myPosts: return "내 글"
        case .ourPosts: return "우리 글"
        case .likePosts: return "좋아요 글"
        }
    }
}


