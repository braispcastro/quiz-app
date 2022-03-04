//
//  LeaderboardViewModel.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation

protocol LeaderboardViewModelProtocol {
    func onAppear()
    func onDisappear()
}

final class LeaderboardViewModel: LeaderboardViewModelProtocol, ObservableObject {
    
    @Published var viewObject: Leaderboard.ViewObject!
    
    private let router: LeaderboardRouter!
    
    init(router: LeaderboardRouter) {
        self.router = router
    }
    
    // MARK: - Public Methods
    
    func onAppear() {
        
    }
    
    func onDisappear() {
        
    }
    
    // MARK: - Private Methods
    
}
