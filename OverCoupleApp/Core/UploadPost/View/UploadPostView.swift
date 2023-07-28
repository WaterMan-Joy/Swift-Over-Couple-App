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
            VStack(alignment: .center, content: {
                
                HStack(content: {
                    Button(action: {
                        print("UPLOAD VIEW: CLICK CANCEL!")
                        dismiss()
                    }, label: {
                        Text("취소")
                    })
                    Spacer()
                    Text("NEW POST")
                    Spacer()
                    Button(action: {
                        print("UPLOAD VIEW: CLICK UPLOAD!")
                        Task {
                            try await viewModel.uploadPost(caption: caption)
                        }
                        dismiss()
                    }, label: {
                        Text("업로드")
                    })
                })
                
                Rectangle().frame(height: 10)
                // upload image
                PhotosPicker(selection: $viewModel.selectedImage, label: {
                    VStack {
                        if let image = viewModel.profileImage {
                            image
                                .resizable()
                                .foregroundColor(.white)
                                .background(.pink)
                                .cornerRadius(20)
                                .frame(width: 200, height: 200)
                            Text("선택 완료")
                                .foregroundColor(.blue)
                                .font(.system(size: 20, weight: .semibold, design: .monospaced))
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .foregroundColor(.white)
                                .padding()
                                .background(.pink)
                                .cornerRadius(20)
                                .frame(width: 200, height: 200)
                            Text("사진 수정")
                                .foregroundColor(.pink)
                                .font(.system(size: 20, weight: .semibold, design: .monospaced))
                        }
                    }
                }) //: PHOTOS PICKER
                
                // UPLOAD READY?
                Text("업로드 준비 완료")
                
                // text field
                TextField("post upload", text: $caption, axis: .vertical)
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    .textFieldStyle(.roundedBorder)
                    .padding()
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
