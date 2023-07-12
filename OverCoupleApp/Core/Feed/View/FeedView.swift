//
//  FeedView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/12.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ... 20, id: \.self) { _ in
                    FeedRowView(username: "Joy", caption: "my X-Friend", coulpename: "Sunny", coupleColor: .green)
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
