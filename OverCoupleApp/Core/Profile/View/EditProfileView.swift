//
//  EditProfileView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EditProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    var body: some View {
        VStack(content: {
            
            // tool bar
            HStack(content: {
                Button(action: {
                    print("CANCEL CLICK")
                    dismiss()
                }, label: {
                    Text("취소")
                })
                Spacer()
                Text("프로필 수정")
                Spacer()
                Button(action: {
                    print("COMPLETE CLICK")
                    Task {
                        try await viewModel.updateUserData()
                    }
                    dismiss()

                }, label: {
                    Text("완료")
                })
            }) //: HSTACK / tool bar
            .font(.system(size: 20, weight: .heavy, design: .monospaced))
            .padding()
            
            Divider()
            
            // edit profile pic
            PhotosPicker(selection: $viewModel.selectedImage, label: {
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .foregroundColor(.white)
                            .background(.pink)
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                        Text("선택 완료")
                            .foregroundColor(.blue)
                            .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    }
                    else {
                        Image(systemName: "person")
                            .resizable()
                            .foregroundColor(.white)
                            .padding()
                            .background(.pink)
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                        Text("사진 수정")
                            .foregroundColor(.pink)
                            .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    }
                }
            }) // PHOTOS PICKER
            .padding()
            Divider()
            VStack(content: {
                HStack(content: {
                    Text("닉네임")
                    TextField("닉네임", text: $viewModel.username)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                })
                HStack(content: {
                    Text("설명")
                    TextField("설명", text: $viewModel.bio)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                })
                Text("사랑하고 있다 없다?")
                Text("내 사랑은 : ")
            })
            .font(.system(size: 20, weight: .semibold, design: .monospaced))
            .padding()
            Spacer()
        }) //: VSTACK / edit profile view
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.MOCK_USERS[0])
    }
}
