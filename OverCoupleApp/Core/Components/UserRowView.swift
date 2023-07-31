//
//  UserRowView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    
    let user: User
    
    var body: some View {
        
        // user + couple + date
        HStack(content: {
            
            // user image + user name
            VStack {
                // user image
                KFImage(URL(string: user.profilePic))
                Text(user.username)
            } //: VSTACK: user image + user name
            
            Spacer()
            
            // couple? + date
            VStack {
                if user.couple == true {
                    Image(systemName: "heart.circle")
                    Text("사귄 날")
                }
            } //: VSTACK: COUPLE? + DATE
            
            Spacer()
            
            // couple image + couple name
            VStack {
                KFImage(URL(string: user.couplePic ?? ""))
                Text(user.couplename ?? "")
            } //: VSTACK: couple image + couple name
            
        }) //: HSTACK: USER + COUPLE + DATE
        .padding()
        .background(.pink)
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: User.MOCK_USERS[0])
    }
}
