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
    func settingsView() -> SettingsView
}

final class MenuRouter: MenuRouterProtocol {
    
    func gameView() -> GameView {
        return GameBuilder.build()
    }
    
    func leaderboardView() -> LeaderboardView {
        return LeaderboardBuilder.build()
    }
    
    func settingsView() -> SettingsView {
        return SettingsBuilder.build()
    }
    
}
