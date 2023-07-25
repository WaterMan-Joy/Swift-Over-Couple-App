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
            Image(user.profilePic)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
            
            // user name & couple name & days
            VStack(alignment: .center, content: {
                // user name & couple name
                HStack(alignment: .center, content: {
                    Spacer()
                    Text(user.username)
                        .foregroundColor(.pink)
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                    Text( "with")
                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    Text(user.couplename ?? "??")
                        .foregroundColor(.pink)
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
            else {
                Image(systemName: "person")
            }
            
        }) //: HSTACK / user image + user name + couple name + days
        .padding()
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: User.MOCK_USERS[0])
    }
}
