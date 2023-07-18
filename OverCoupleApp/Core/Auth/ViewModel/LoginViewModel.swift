//
//  LoginViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/18.
//

import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    
    // view properties
    @Published var mobileNum: String = ""
    @Published var otpCode: String = ""
    
    @Published var CLIENT_CODE: String = ""
    @Published var showOTPField: Bool = false
    
    // error properties
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    // firebase api's
    func getOTPCode() {
        UIApplication.shared.closeKeyBoard()
        Task {
            do {
                // disable it when testing with real device
                Auth.auth().settings?.isAppVerificationDisabledForTesting = true
                
                let code = try await PhoneAuthProvider.provider().verifyPhoneNumber("+8210\(mobileNum)", uiDelegate: nil)
                await MainActor.run(body: {
                    CLIENT_CODE = code
                    
                    withAnimation(.easeInOut) { showOTPField = true}
                })
            }
            catch {
                await handleError(error: error)
            }
        }
    }
    
    func verifyOTPCode() {
        UIApplication.shared.closeKeyBoard()
        Task {
            do {
                let credential = PhoneAuthProvider.provider().credential(withVerificationID: CLIENT_CODE, verificationCode: otpCode)
                
                try await Auth.auth().signIn(with: credential)
                
                print("Success!!")
            }
            
            catch {
                await handleError(error: error)

            }
        }
    }
    
    
    // handling error
    func handleError(error: Error) async {
        await MainActor.run(body: {
            errorMessage = error.localizedDescription
            showError.toggle()
        })
    }
}

// extensions
extension UIApplication {
    func closeKeyBoard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
