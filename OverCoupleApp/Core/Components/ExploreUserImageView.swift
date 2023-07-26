//
//  ExploreUserRowView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/26.
//

import SwiftUI
import Kingfisher

struct ExploreUserImageView: View {
    let user: User
    var body: some View {
        KFImage(URL(string: user.profilePic))
            .resizable()
            .scaledToFit()
            .frame(width: 60, height: 60)
            .clipShape(Circle())
    }
}

struct ExploreUserImageView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreUserImageView(user: User.MOCK_USERS[0])
    }
}
