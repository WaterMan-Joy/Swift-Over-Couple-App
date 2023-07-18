//
//  UploadPostView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/16.
//

import SwiftUI

struct UploadPostView: View {
    
    @State private var text: String = ""
//    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss


    
    var body: some View {
        
        NavigationView(content: {
            
            // upload post view
            VStack(alignment: .leading, content: {
                
                Text(User.MOCK_USERS[0].username)
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                Rectangle().frame(height: 10)
                // upload image
                HStack(alignment: .top, content: {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text(User.MOCK_USERS[0].couplename ?? "NONE")
                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
                }) //: HSTACK / upload image
                
                // text field
                TextField("post upload", text: $text, axis: .vertical)
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button(action: {
                    print("location button click")
                }, label: {
                    Text("location")
                        .font(.system(size: 10, weight: .semibold, design: .monospaced))
                        .foregroundColor(.white)
                        .padding()
                        .background(.gray)
                        .cornerRadius(10)
                })
                Spacer()
                
                
            }) //: VSTACKL / upload post view
            .padding()
            
            // tool bar
            .toolbar(content: {
                
                // cancel tool bar item
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Button(action: {
                        print("click cancel")
//                        self.presentationMode.wrappedValue.dismiss()
                        self.dismiss()
                    }, label: {
                        Text("CANCEL")
                            .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    })
                }) //: TOOL BAR ITEM / cancel tool bar item
                
                // upload tool bar item
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        print("click upload")
                    }, label: {
                        Text("UPLOAD")
                            .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    })
                }) //: TOOL BAR ITEM / upload tool bar item
                
            }) //: TOOL BAR
            
        }) //: NAVIGATION VIEW
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
