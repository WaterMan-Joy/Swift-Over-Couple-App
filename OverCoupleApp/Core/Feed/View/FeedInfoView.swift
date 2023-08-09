//
//  FeedInfoView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/31.
//

import SwiftUI
import Kingfisher

struct FeedInfoView: View {
    
    let post: Post

//    @ObservedObject var viewModel: FeedViewModel
    
    @State var text: String = ""
    
    var body: some View {
        VStack {
            
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .cornerRadius(20)
                .padding()
                .scaledToFit()
                .frame(maxWidth: .infinity)
            
            HStack {
                Text(post.caption)
                    .font(.system(.body, design: .monospaced, weight: .semibold))
                Spacer()
            }
            .padding()
            
            Divider()
            
            HStack {
                TextField("댓글 남기기", text: $text)
                Button(action: {
                    print("FEED INFO VIEW: CLICK COMMENT")
                }, label: {
                    Text("확인")
                })
            }
            .padding()
            
            Divider()
            
            Spacer()
        } //: VSTACK: FEED INFO VIEW
    }
}

struct FeedInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FeedInfoView(post: Post.MOCK_POSTS[0])
    }
}
