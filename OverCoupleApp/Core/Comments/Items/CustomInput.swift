//
//  CustomInput.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/05.
//

import SwiftUI

struct CustomInput: View { 
    
    @Binding var inputText: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)
            
            HStack {
                TextField("댓글 입력..", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                    .padding(.horizontal)
                
                Button(action: action, label: {
                    Text("보내기")
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                })
            }
        }
        .padding(.bottom, 10)
        .padding(.horizontal, 10)
    }
}


