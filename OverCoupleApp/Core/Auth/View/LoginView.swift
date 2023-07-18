//
//  LoginView.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/17.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginModel: LoginViewModel = .init()
    
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
            
            // phone login
            VStack(content: {
                HStack(content: {
                    Text("(+82)010")
                    TextField("12345678", text: $loginModel.mobileNum)
                })
                .disabled(loginModel.showOTPField)
                .opacity(loginModel.showOTPField ? 0.4 : 1.0)
                .overlay(alignment: .trailing, content: {
                    Button(action: {
                        withAnimation(.easeInOut) {
                            loginModel.showOTPField = false
                            loginModel.otpCode = ""
                            loginModel.CLIENT_CODE = ""
                            loginModel.mobileNum = ""
                        }
                    }, label: {
                        Image(systemName: "x.circle.fill")
                    })
                    .opacity(loginModel.showOTPField ? 1 : 0)
//                    Button("Change") {
//                        withAnimation(.easeInOut) {
//                            loginModel.showOTPField = false
//                            loginModel.otpCode = ""
//                            loginModel.CLIENT_CODE = ""
//                            loginModel.mobileNum = ""
//                        }
//                    }
//                    .opacity(loginModel.showOTPField ? 1 : 0)
                })
                
                
                HStack(content: {
                    Text("OTP CODE:")
                    TextField("otp code", text: $loginModel.otpCode)
                })
                .disabled(!loginModel.showOTPField)
                .opacity(!loginModel.showOTPField ? 0.4 : 1.0)
                
                // phone login button
                Button(action: {
                    loginModel.showOTPField ? loginModel.verifyOTPCode() : loginModel.getOTPCode()
                }, label: {
                    HStack(content: {
                        loginModel.showOTPField ? HStack(content: {
                            Image(systemName: "phone.circle.fill")
                                .padding(.horizontal)
                            Text("VERIFY CODE")
                                .padding(.trailing)
                        }) : HStack(content: {
                            Image(systemName: "barcode")
                                .padding(.horizontal)
                            Text("GET CODE")
                                .padding(.trailing)
                        })
                    })
                })
                .padding()
                
            })
            .frame(maxWidth: .infinity)
            .padding()
            .background(.pink)
            .cornerRadius(15)
            .foregroundColor(.white)
            .font(.system(size: 25, weight: .semibold, design: .monospaced))
                
            
            
            
            Button(action: {
                print("google login")
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
            
            Button(action: {
                print("apple login")
            }, label: {
                HStack(content: {
                    Image(systemName: "apple.logo")
                        .padding(.horizontal)
                    Text("APPLE LOGIN")
                        .padding(.trailing)
                })
                .frame(maxWidth: .infinity)
                .padding()
                .background(.pink)
                .cornerRadius(15)
                .foregroundColor(.white)
                .font(.system(size: 25, weight: .semibold, design: .monospaced))
            }) //: BUTTON
            .alert(loginModel.errorMessage, isPresented: $loginModel.showError) {}
        }) //: VSTACK
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
