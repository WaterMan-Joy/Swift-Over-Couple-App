//
//  FeedInfoViewModel.swift
//  OverCoupleApp
//
//  Created by 김종희 on 2023/08/09.
//

import Foundation


class FeedInfoViewModel: ObservableObject {
    
    func addCouple(coupleId: String) async throws {
        try await CoupleService.addCouple(coupleId: coupleId)
    }
    
    func removeCouple() async throws {
        try await CoupleService.removeCouple()
    }
}
