//
//  GameBuilder.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation

final class GameBuilder {
    
    static func build() -> GameView {
        
        let router: GameRouter = GameRouter()
        let viewModel: GameViewModel = GameViewModel(router: router)
        let view: GameView = GameView(viewModel: viewModel)

        return view
    }
    
}
