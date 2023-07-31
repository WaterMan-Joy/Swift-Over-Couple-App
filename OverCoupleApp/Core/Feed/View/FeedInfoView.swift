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
    
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        VStack {
            KFImage(URL(string: post.user?.profilePic ?? ""))
            Text(post.user?.username ?? "")
            if post.user?.couple == false{
                Button(action: {
                    print("FEED INFO VIEW: CLICK 사귀기")
                    Task {
                        try await viewModel.addCouple(coupleId: post.user?.id ?? "")
                    }
                }, label: {
                    Text("사귀기")
                })
            } else if post.user?.couple == true{
                Button(action: {
                    print("FEED INFO VIEW: CLICK 헤어지기")
                }, label: {
                    Text("헤어지기")
                })
            }
            
        }
    }
}

struct FeedInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FeedInfoView(post: Post.MOCK_POSTS[0])
    }
}
