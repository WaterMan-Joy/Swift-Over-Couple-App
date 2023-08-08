//
//  NotificationCell.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/01.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    
    @ObservedObject var viewModel: NotificationCellViewModel
    
    var isFollowed: Bool { return viewModel.notification.isFollowed ?? false}
    
    init(viewModel: NotificationCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            KFImage(URL(string: viewModel.notification.profileImageUrl))
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            
            VStack {
                HStack {
                    Text("\(viewModel.notification.username)님이")
                        .bold()
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text(viewModel.notification.type.notificationMessage)
                }
            }
            .font(.system(size: 20, weight: .semibold, design: .monospaced))
            .padding(.horizontal)
            
            Spacer()
            if viewModel.notification.type == .comment || viewModel.notification.type == .like {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 50, height: 50)
            } else if viewModel.notification.type == .follow {
                Button(action: {
                    print("NOTIFICATION CELL: CLICK FOLLOW BUTTON")
                }, label: {
                    Text(isFollowed ? "팔로잉" : "팔로우")
                        .padding()
                        .background(isFollowed ? .black : .pink)
                        .foregroundColor(.white)
                        .frame(height: 40)
                        .cornerRadius(30)
                })
            }
        }
        .padding(.horizontal)
    }
}

//struct NotificationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationCell()
//    }
//}
