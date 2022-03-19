//
//  GameRouter.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation

protocol GameRouterProtocol {
    func promptName(points: String) -> NamePromptView
}

final class GameRouter: GameRouterProtocol {
    
    func promptName(points: String) -> NamePromptView {
        NamePromptBuilder.build(points: points)
    }
    
}
