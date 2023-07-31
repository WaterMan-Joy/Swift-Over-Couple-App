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
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                Text(user.username)
                    .font(.system(size: 10))
            } //: VSTACK: user image + user name
            
            Spacer()
            
            // couple? + date
            VStack {
                if user.couple == true {
                    Image(systemName: "heart.circle")
                    Text("사귄 날")
                }
            } //: VSTACK: COUPLE? + DATE
            .font(.system(size: 20))
            
            Spacer()
            
            // couple image + couple name
            VStack {
                KFImage(URL(string: user.couplePic ?? ""))
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                Text(user.couplename ?? "")
                    .font(.system(size: 10))
            } //: VSTACK: couple image + couple name
            
        }) //: HSTACK: USER + COUPLE + DATE
        .font(.system(size: 20, weight: .bold, design: .monospaced))
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
