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

    @ObservedObject var viewModel: FeedViewModel
    
    @State var text: String = ""
    
    var body: some View {
        VStack {
            
//            // user image + couple image
//            HStack {
//
//                // user image
//                VStack {
//                    KFImage(URL(string: user.profilePic))
//                        .resizable()
//                        .frame(width: 100, height: 100)
//                        .cornerRadius(10)
//
//                    Text(user.username)
//                } //: VSTACK: USER IMAGE
//
//
//                Image(systemName: "heart.circle")
//                    .font(.system(size: 50))
//                    .foregroundColor(.pink)
//
//                if viewModel.user?.couple == false && post.ownerUid != viewModel.user?.id {
//                    Button(action: {
//                        Task {
//                            try await viewModel.addCouple(coupleId: post.ownerUid)
//                        }
//                    }, label: {
//                        VStack{
//                            Image(systemName: "figure.2.arms.open")
//                            Text("커플신청")
//                        }
//                    })
//                }
                
//                // couple image
//                VStack {
//                    KFImage(URL(string: user.couplePic ?? ""))
//                        .resizable()
//                        .frame(width: 100, height: 100)
//                        .cornerRadius(10)
//
//                    Text(user.couplename ?? "")
//                } //: VSTACK: COUPLE IMAGE
//
//            } //: HSTACK: USER IMAGE + COUPLE IMAGE
//
//            Divider()
            
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
        FeedInfoView(post: Post.MOCK_POSTS[0], viewModel: FeedViewModel(user: User.MOCK_USERS[0]))
    }
}
