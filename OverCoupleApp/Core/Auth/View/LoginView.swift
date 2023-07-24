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
    
    @EnvironmentObject var viewModel: ContentViewModel
    
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
                

                
                
                Button(action: {
                    print("sign up with google")
                    viewModel.service.signUpWithGoogle()
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

//struct LoginView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        LoginView()
//
//    }
//}

