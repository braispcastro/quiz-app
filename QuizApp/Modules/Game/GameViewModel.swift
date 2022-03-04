//
//  GameViewModel.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation

protocol GameViewModelProtocol {
    func onAppear()
    func onDisappear()
}

final class GameViewModel: GameViewModelProtocol, ObservableObject {
    
    @Published var viewObject: Game.ViewObject!
    
    private let router: GameRouter!
    
    init(router: GameRouter) {
        self.router = router
    }
    
    // MARK: - Public Methods
    
    func onAppear() {
        
    }
    
    func onDisappear() {
        
    }
    
    // MARK: - Private Methods
    
}
