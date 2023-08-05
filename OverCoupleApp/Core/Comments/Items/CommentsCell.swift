//
//  CommentsCell.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/05.
//

import SwiftUI

struct CommentsCell: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
                .frame(width: 30, height: 30)
            
            Text("Joy Kim")
                .font(.system(size: 15, weight: .bold, design: .monospaced))
            Text("님이 메시지를 보냈습니다")
                .font(.system(size: 15, weight: .semibold, design: .monospaced))
            Spacer()
            Text("시간")
            
        }
        .padding(.horizontal)
    }
}

struct CommentsCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentsCell()
    }
}
