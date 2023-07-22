//
//  +View.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/07/19.
//

import Foundation
import SwiftUI

//extension View {
//    func getRootViewController() -> UIViewController {
//        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
//            return .init()
//        }
//
//        guard let root = screen.windows.first?.rootViewController else {
//            return .init()
//        }
//
//        return root
//    }
//}

final class ApplicationHelper {
    static var rootViewController: UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
}
