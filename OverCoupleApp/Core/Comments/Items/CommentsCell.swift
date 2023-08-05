//
//  CommentsCell.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/05.
//

import SwiftUI
import Kingfisher

struct CommentsCell: View {
    
    let comment: Comment
    
    var body: some View {
        HStack {
            KFImage(URL(string: comment.profileImageUrl))
                .frame(width: 30, height: 30)
                .clipShape(Circle())
            
            Text(comment.username)
                .font(.system(size: 15, weight: .bold, design: .monospaced))
            Text("님이 메시지를 보냈습니다")
                .font(.system(size: 15, weight: .semibold, design: .monospaced))
            Spacer()
            Text(comment.timestamp.dateValue().formatted())
            
        }
        .padding(.horizontal)
    }
}

//struct CommentsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsCell()
//    }
//}
