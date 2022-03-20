//
//  GameRouter.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation

protocol GameRouterProtocol {
    func namePrompt(points: Int) -> NamePromptView
}

final class GameRouter: GameRouterProtocol {
    
    func namePrompt(points: Int) -> NamePromptView {
        NamePromptBuilder.build(points: points)
    }
    
}
