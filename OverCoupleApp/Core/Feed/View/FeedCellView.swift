//
//  FeedRowVIew.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI
import Kingfisher

struct FeedCellView: View {
    
    var didLike: Bool {
        return feedCellViewModel.post.didLike ?? false
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
                NavigationLink(destination: {
                    ProfileView(user: feedCellViewModel.post.user ?? User.MOCK_USERS[0])
                }, label: {
                    KFImage(URL(string: feedCellViewModel.post.user?.profilePic ?? ""))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                })
                
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
                .scaledToFill()
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
                    
                    // date
                    Text("\(feedCellViewModel.post.timestamp.dateValue().formatted())")
                        .font(.system(size: 15))
                    Spacer()

                    // comments button
                    Button(action: {
                        print("FEED ROW VIEW: CLICK COMMENT")
                    }, label: {
                        Image(systemName: "text.bubble")
                            
                    }) //: COMMENTS BUTTON
                    
                    // likes button
                    Button(action: {
                        print("FEED CELL VIEW: CLICK LIKES")
                        didLike ? feedCellViewModel.unLike() :  feedCellViewModel.like()
                        
                    }, label: {
                        Image(systemName: didLike ? "heart.fill" : "heart")
                            
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
        
        
    } //: VSTACK / FEED ROW VIEW
}

struct FeedCellView_Previews: PreviewProvider {
    static var previews: some View {
        FeedCellView(feedCellViewModel: FeedCellViewModel(post: Post.MOCK_POSTS[0]))
    }
}
