//
//  FeedRowVIew.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI

struct FeedRowView: View {
    
    let username: String
    let caption: String
    let coulpename: String
    let coupleColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30, content: {
            
            // profile image + user info + feed caption + action buttons
            HStack(alignment: .top, content: {
                Circle()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color(.systemBlue))
                
                // user info & feed caption
                VStack(alignment: .leading, content: {
                    
                    // user info
                    HStack(content: {
                        Text(username)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                        
                        Text("with \(coulpename)")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(Color(.systemGray))
                    }) //: HSTACK user info
                    
                    // feed caption
                    Text(caption)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                }) //: VSTACK user info & feed caption
                .padding(.leading, 10)
                
            }) //: HSTACK profile image + user info + feed caption
            
            // action buttons + date
            HStack(content: {
                Text("2 week")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(Color(.systemGray))
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "text.bubble")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.black)
                })
                Button(action: {}, label: {
                    Image(systemName: "heart")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.black)
                })
            }) //: HSTACK
            
        }) //: VSTACK
        .frame(maxWidth: .infinity)
        .padding(.all, 30)
        .background(coupleColor)
        .cornerRadius(20)
        .padding()
    }
}

struct FeedRowView_Previews: PreviewProvider {
    static var previews: some View {
        FeedRowView(username: "Name", caption: "Caption", coulpename: "Couple Name", coupleColor: .white)
    }
}
