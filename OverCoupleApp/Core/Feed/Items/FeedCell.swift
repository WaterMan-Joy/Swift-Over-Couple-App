//
//  FeedRowVIew.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    // Computed Property
    var didLike: Bool {
        get {
            return feedCellViewModel.post.didLike ?? false
        }
    }
    
    // VM
    @ObservedObject var feedCellViewModel: FeedCellViewModel
    
    // INIT
    init(feedCellViewModel: FeedCellViewModel) {
        self.feedCellViewModel = feedCellViewModel
        
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30, content: {
            
            HStack {
                if let user = feedCellViewModel.post.user {
                    NavigationLink(destination: {
                        ProfileView(user: user)
                    }, label: {
                        KFImage(URL(string: user.profilePic))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    })
                }
                
                Text(feedCellViewModel.post.user?.username ?? "")
                    .font(.system(.headline, design: .monospaced, weight: .semibold))
                    .foregroundColor(.black)
                
                Spacer()
                
                Text(feedCellViewModel.post.user?.couplename ?? "")
                    .font(.system(.headline, design: .monospaced, weight: .semibold))
                    .foregroundColor(.black)
                
                KFImage(URL(string: feedCellViewModel.post.user?.couplePic ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
            }
            .padding(.horizontal)
            .padding(.top)
                
            
            // post image
            KFImage(URL(string: feedCellViewModel.post.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                
            
            VStack(alignment: .leading) {
                // feed caption
                Text(feedCellViewModel.post.caption)
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .padding(.bottom, 20)
                
                Text("\(feedCellViewModel.likeString)")
                    .font(.system(size: 20, design: .monospaced))


                // action buttons + date
                HStack(content: {
                    
                    // DATE
                    Text("\(feedCellViewModel.post.timestamp.dateValue().formatted())")
                        .font(.system(size: 15))
                    //: DATE
                    
                    Spacer()

                    // NAVIGATION COMMENTS BUTTON
                    NavigationLink(destination: {
                        CommentsView(post: feedCellViewModel.post)
                    }, label: {
                        Text("댓글\(feedCellViewModel.postCount)개")
                        Image(systemName: "text.bubble")
                    }) //: NAVIGATION COMMENTS BUTTON
                    
                    // likes button
                    Button(action: {
                        print("FEED CELL VIEW: CLICK LIKES")
                        didLike ? feedCellViewModel.unLike() :  feedCellViewModel.like()
                        
                    }, label: {
                        Image(systemName: didLike ? "heart.fill" : "heart")
                            .foregroundColor(didLike ? .red : .black)
                            
                    }) //: LIKES BUTTON
                    
                }) //: HSTACK
            } //: VSTACK
            .padding(.horizontal)
            .padding(.bottom)
            
        }) //: VSTACK
        .font(.system(size: 20, weight: .semibold, design: .monospaced))
        .foregroundColor(.black)
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
        .padding()
    }

}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(feedCellViewModel: FeedCellViewModel(post: Post.MOCK_POSTS[0]))
    }
}
