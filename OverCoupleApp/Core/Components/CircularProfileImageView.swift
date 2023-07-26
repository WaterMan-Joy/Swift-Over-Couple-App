//
//  CircularProfileImageView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/26.
//

import SwiftUI
import Kingfisher

struct CircularProfileImageView: View {
    
    let user: User
    
    var body: some View {
        KFImage(URL(string: user.profilePic))
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: User.MOCK_USERS[0])
    }
}

