//
//  MenuRouter.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation

protocol MenuRouterProtocol {
    func gameView() -> GameView
    func leaderboardView() -> LeaderboardView
}

final class MenuRouter: MenuRouterProtocol {
    
    func gameView() -> GameView {
        return GameBuilder.build()
    }
    
    func leaderboardView() -> LeaderboardView {
        return LeaderboardBuilder.build()
    }
    
}
