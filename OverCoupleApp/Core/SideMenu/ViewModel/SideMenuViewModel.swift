//
//  SideMenuViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    
    case profile
    case lists
    case bookmarks
        
    var description: String {
        switch self {
        case .profile: return "PROFILE"
        case .lists: return "LISTS"
        case .bookmarks: return "BOOKMARKS"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile: return "person"
        case .lists: return "list.bullet.rectangle.portrait"
        case .bookmarks: return "bookmark"
        }
    }
}
