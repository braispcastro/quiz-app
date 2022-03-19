//
//  LeaderboardViewModel.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation
import SwiftUI

protocol LeaderboardViewModelProtocol {
    func onAppear(_ presentation: Binding<PresentationMode>)
    func onDisappear()
}

final class LeaderboardViewModel: ObservableObject {
    
    @Published var viewObject: Leaderboard.ViewObject!
    
    private var presentation: Binding<PresentationMode>!
    
    private let router: LeaderboardRouter!
    
    init(router: LeaderboardRouter) {
        self.router = router
        prepareView()
    }
    
    private func prepareView() {
        viewObject = Leaderboard.ViewObject()
    }
    
    // MARK: - Private Methods
    
}

// MARK: - LeaderboardViewModelProtocol
extension LeaderboardViewModel: LeaderboardViewModelProtocol {
    
    func onAppear(_ presentation: Binding<PresentationMode>) {
        self.presentation = presentation
        viewObject.ranking = RankingManager.shared.getRankingFromMemory()
    }
    
    func onDisappear() {
        
    }
    
}
