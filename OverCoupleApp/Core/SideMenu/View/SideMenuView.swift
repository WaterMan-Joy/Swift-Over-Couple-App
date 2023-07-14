//
//  SideMenuView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/13.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        
        // side menu view
        VStack(spacing: 40, content: {
            
            // user name + user image + couple name + couple image
            VStack(alignment: .leading, content: {
                SideMenuRowView()
            })
            .padding(.all, 50)
            .background(.pink)
            .cornerRadius(20)
            
            // sie menus
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) {sideMenu in
                
                // side menu
                HStack(spacing: 20, content: {
                    Image(systemName: sideMenu.imageName)
                        .font(.system(size: 30, weight: .semibold, design: .monospaced))
                    
                    Text(sideMenu.description)
                        .font(.system(size: 30, weight: .semibold, design: .monospaced))
                    
                }) //: HSTACK / side menu
                .foregroundColor(.pink)
                
            } //: FOR EACH / sie menus
            
            Spacer()
            
        }) //: VSTACK / side menu view
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
