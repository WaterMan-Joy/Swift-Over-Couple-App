//
//  NotificationCell.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/01.
//

import SwiftUI

struct NotificationCell: View {
    
    @State private var showPostImage = false
    var body: some View {
        HStack {
            Image(systemName: "person")
            Text("알림 표시")
            Spacer()
            if showPostImage {
                Image(systemName: "person.2.crop.square.stack")
            } else {
                Button(action: {
                    print("NOTIFICATION CELL: CLICK FOLLOW BUTTON")
                }, label: {
                    Text("팔로우")
                        .padding()
                        .background(.pink)
                        .foregroundColor(.white)
                        .frame(height: 40)
                        .cornerRadius(30)
                })
            }
        }
        .font(.system(size: 25, weight: .semibold, design: .monospaced))
        .foregroundColor(.pink)
        .padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
