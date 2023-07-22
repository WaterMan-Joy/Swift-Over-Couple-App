//
//  LoginView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/17.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

struct LoginView: View {
    
    @EnvironmentObject var viewModel: LoginViewModel
    
    var body: some View {
        
            VStack(alignment: .center, content: {
                
                Spacer()
                Text("WELCOME TO OVER COUPLE")
                Text("OVER COUPLE")
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 50, weight: .bold, design: .monospaced))
                    .padding()
                    .background(.pink)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                Text("ONLY ENG")
                Spacer()
                
//                GoogleSignInButton()
//                    .padding()
//                            .onTapGesture {
//                              viewModel.signUpWithGoogle()
//                            }
                
                Text("GOOGLE GOGO")
                    .onTapGesture {
                        viewModel.signUpWithGoogle()
                    }
                
                
                Button(action: {
                    print("")
                    viewModel.signUpWithGoogle()
                }, label: {
                    HStack(content: {
                        Image(systemName: "g.circle.fill")
                            .padding(.horizontal)
                        Text("GOOGLE LOGIN")
                            .padding(.trailing)
                    })
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.pink)
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                }) //: BUTTON
                Spacer()

            }) //: VSTACK
            .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//struct GoogleSignInButton: UIViewRepresentable {
//  @Environment(\.colorScheme) var colorScheme
//
//  private var button = GIDSignInButton()
//
//  func makeUIView(context: Context) -> GIDSignInButton {
//    button.colorScheme = colorScheme == .dark ? .dark : .light
//    return button
//  }
//
//  func updateUIView(_ uiView: UIViewType, context: Context) {
//    button.colorScheme = colorScheme == .dark ? .dark : .light
//  }
//}
