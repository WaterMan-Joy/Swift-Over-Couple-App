//
//  SideMenuItemRowView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/14.
//

import SwiftUI

struct SideMenuItemRowView: View {
    
    let viewModel: SideMenuViewModel
    
    var body: some View {
        // side menu
        HStack(spacing: 20, content: {
            Image(systemName: viewModel.imageName)
                .font(.system(size: 30, weight: .semibold, design: .monospaced))
            
            Text(viewModel.description)
                .font(.system(size: 30, weight: .semibold, design: .monospaced))
            
        }) //: HSTACK / side menu
        .foregroundColor(.pink)
    }
}

struct SideMenuItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuItemRowView(viewModel: .profile)
    }
}
