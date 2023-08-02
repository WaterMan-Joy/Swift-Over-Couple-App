//
//  SideMenuRowView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import SwiftUI
import Kingfisher

struct SideMenuRowView: View {
    
    let user: User
    
    var body: some View {
        // side menu view
        VStack {
            
            // user name + user image + couple name + couple Image
            HStack(content: {
                
                // user name & user image
                VStack(content: {
                    CircularProfileImageView(user: user, post: nil, size: CircularProfileImageView.ProfileImageSize.large)
                        
                    
                    Text(user.username)
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                }) //: VSTACK / user name & user image
                
                Text("WITH")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                
                // couple name & couple image
                VStack(content: {
                    
                    KFImage(URL(string: user.couplePic ?? ""))
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaledToFill()
                        .clipShape(Circle())
                    
                    Text(user.couplename ?? "")
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
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
