//
//  CircularProfileImageView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/26.
//

import SwiftUI
import Kingfisher

struct CircularProfileImageView: View {
    
    enum ProfileImageSize: CGFloat {
        case small
        case medium
        case large
        
        var sizes: CGFloat {
            switch self {
            case .small:
                return 60
            case .medium:
                return 80
            case .large:
                return 100
            }
        }
    }
    
    let user: User?
    let post: Post?
    let size: ProfileImageSize
    
    var body: some View {
        if user != nil {
            KFImage(URL(string: user?.profilePic ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: size.sizes, height: size.sizes)
                .clipShape(Circle())
        }
        else if post != nil {
            KFImage(URL(string: post?.user?.profilePic ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: size.sizes, height: size.sizes)
                .clipShape(Circle())
        }
//        KFImage(URL(string: user?.profilePic ?? ""))
//            .resizable()
//            .scaledToFill()
//            .frame(width: size.sizes, height: size.sizes)
//            .clipShape(Circle())
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: User.MOCK_USERS[0], post: Post.MOCK_POSTS[0], size: .large)
    }
}

