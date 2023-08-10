//
//  NotificationView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI

struct NotificationView: View {
    
    @ObservedObject var notificationViewModel = NotificationViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(notificationViewModel.notifications) { notification in
                            NotificationCell(viewModel: NotificationCellViewModel(notification: notification))
                            Divider()
                        }
                    }
                
                }
                .refreshable {
                    notificationViewModel.fetchNotifications()
                }
            }
            .navigationTitle("알림")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
