//
//  UploadPostView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/16.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    
    @State private var caption: String = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
       
            // upload post view
            VStack(alignment: .leading, content: {
                
                HStack(content: {
                    Button(action: {
                        print("cancel click")
                        dismiss()
                    }, label: {
                        Text("CANCEL")
                    })
                    Spacer()
                    Text("NEW POST")
                    Spacer()
                    Button(action: {
                        print("upload click")
                    }, label: {
                        Text("UPLOAD")
                    })
                })
                
                Rectangle().frame(height: 10)
                // upload image
                HStack(alignment: .top, content: {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .frame(width: 100, height: 100)
                    }
                }) //: HSTACK / upload image
                
                // text field
                TextField("post upload", text: $caption, axis: .vertical)
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
            .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
            .onAppear {
                imagePickerPresented.toggle()
            }
            .padding()
            
        
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
