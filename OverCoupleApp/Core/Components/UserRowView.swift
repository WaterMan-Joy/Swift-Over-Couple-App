//
//  UserRowView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import SwiftUI

struct UserRowView: View {
    
    let username: String
    let couplename: String
    
    var body: some View {
        
        // user image + couple image + user name + couple name + days
        HStack(content: {
            
            // user image
            Circle()
                .frame(width: 50, height: 50)
            
            // user name & couple name & days
            VStack(alignment: .center, content: {
                // user name & couple name
                HStack(alignment: .center, content: {
                    Spacer()
                    Text(username)
                        .foregroundColor(.pink)
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                    Text( "with")
                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    Text(couplename)
                        .foregroundColor(.pink)
                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    Spacer()
                }) //: HSTACK / user name & couple name
                
                // days
                Text("63 days")
                    .font(.system(size: 15, weight: .semibold, design: .monospaced))
            }) //: VSTACK / user name + couple name + days
            
            // couple image
            Circle()
                .frame(width: 50, height: 50)
            
        }) //: HSTACK / user image + user name + couple name + days
        .padding()
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(username: "user name", couplename: "couple name")
    }
}
