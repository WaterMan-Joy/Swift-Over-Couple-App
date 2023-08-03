//
//  SearchCell.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/02.
//

import SwiftUI
import Kingfisher

struct SearchCell: View {
    
    let user: User
    
    var body: some View {
        HStack {
            KFImage(URL(string: user.profilePic))
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            Text(user.username)
                .font(.system(.title2, design: .monospaced, weight: .bold))
                .foregroundColor(.black)
            Spacer()
            Text(user.couplename ?? "")
                .font(.system(.title2, design: .monospaced, weight: .bold))
                .foregroundColor(.black)
            KFImage(URL(string: user.couplePic ?? ""))
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
        }
        .padding(.horizontal)
    }
}

struct SearchCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchCell(user: User.MOCK_USERS[0])
    }
}
