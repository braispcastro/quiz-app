//
//  GameRouter.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation

protocol GameRouterProtocol {
    func namePrompt(points: Int, isShown: Bool, onDone: @escaping (String) -> Void) -> NamePromptView
}

final class GameRouter: GameRouterProtocol {
    
    func namePrompt(points: Int, isShown: Bool, onDone: @escaping (String) -> Void) -> NamePromptView {
        return NamePromptBuilder.build(points: points, isShown: isShown) { name in
            onDone(name)
        }
    }
    
}
