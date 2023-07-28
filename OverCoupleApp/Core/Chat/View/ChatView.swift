//
//  MessagesView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Chat View")
            }
            .navigationTitle("채팅하기")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
