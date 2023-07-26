//
//  UserRowView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import SwiftUI

struct UserRowView: View {
    
//    let username: String
//    let couplename: String
    
    let user: User
    
    var body: some View {
        
        // user image + couple image + user name + couple name + days
        HStack(content: {
            
            // user image
            ExploreUserImageView(user: user)
            
            // user name & couple name & days
            VStack(alignment: .center, content: {
                // user name & couple name
                HStack(alignment: .center, content: {
                    Spacer()
                    Text(user.username)
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                    Text(user.couple ? user.couplename ?? "WITH" : "")
                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    Text(user.couple ? user.couplename ?? "" : "는 사랑하고 싶어요")
                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    Spacer()
                }) //: HSTACK / user name & couple name
                
                // days
                if user.couple {
                    Text("63 days")
                        .font(.system(size: 15, weight: .semibold, design: .monospaced))
                }
                else {
                    Text("0 days")
                        .font(.system(size: 15, weight: .semibold, design: .monospaced))
                }
            }) //: VSTACK / user name + couple name + days
            
            // couple image
            if user.couple {
                Text("Yes")
            }
            
            
        }) //: HSTACK / user image + user name + couple name + days
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
