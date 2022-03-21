//
//  MenuViewModel.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation

protocol MenuViewModelProtocol {
    func showGameView() -> GameView
    func showLeaderboardView() -> LeaderboardView
    func showSettingsView() -> SettingsView
}

final class MenuViewModel: ObservableObject {
    
    @Published var viewObject: Menu.ViewObject!
    
    private let router: MenuRouter!
    
    init(router: MenuRouter) {
        self.router = router
        prepareView()
    }
    
    // MARK: - Private Methods
    
    private func prepareView() {
        viewObject = Menu.ViewObject(title: "QUIZ APP!",
                                     play: "JUGAR",
                                     leaderboard: "PUNTUACIONES",
                                     settings: "OPCIONES")
    }
    
}

// MARK: - MenuViewModelProtocol
extension MenuViewModel: MenuViewModelProtocol {
    
    func showGameView() -> GameView {
        return router.gameView()
    }
    
    func showLeaderboardView() -> LeaderboardView {
        return router.leaderboardView()
    }
    
    func showSettingsView() -> SettingsView {
        return router.settingsView()
    }
    
}
