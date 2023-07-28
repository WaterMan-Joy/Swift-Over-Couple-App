//
//  NotificationView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("알림 페이지")
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
