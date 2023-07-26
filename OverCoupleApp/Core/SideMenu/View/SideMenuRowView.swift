//
//  SideMenuRowView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import SwiftUI

struct SideMenuRowView: View {
    
    let user: User
    
    var body: some View {
        // side menu view
        VStack {
            
            // user name + user image + couple name + couple Image
            HStack(content: {
                
                // user name & user image
                VStack(content: {
                    CircularProfileImageView(user: user)
                        
                    
                    Text(user.username)
                        .font(.system(size: 30, weight: .bold, design: .monospaced))
                }) //: VSTACK / user name & user image
                
                Text("WITH")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                
                // couple name & couple image
                VStack(content: {
                    Circle()
                        .frame(width: 50, height: 50)
                    
                    Text(user.couplename ?? "")
                        .font(.system(size: 30, weight: .bold, design: .monospaced))
                }) //: VSTACK / couple name & couple image
                
            }) //: HSTACK / user name + user image + couple name + couple Image
            
        } //: VSTACK / side menu view
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(user: User.MOCK_USERS[0])
    }
}
