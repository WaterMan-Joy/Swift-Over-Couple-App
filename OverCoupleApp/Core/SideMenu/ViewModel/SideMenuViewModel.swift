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
    case logout
        
    var description: String {
        switch self {
        case .profile: return "PROFILE"
        case .lists: return "LISTS"
        case .bookmarks: return "BOOKMARKS"
        case .logout: return "LOGOUT"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile: return "person"
        case .lists: return "list.bullet.rectangle.portrait"
        case .bookmarks: return "bookmark"
        case .logout: return "arrow.left.square"
        }
    }
}
