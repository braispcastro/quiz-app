//
//  NamePromptBuilder.swift
//  QuizApp
//
//  Created by Brais Castro on 19/3/22.
//

import Foundation

final class NamePromptBuilder {
    
    static func build(points: String) -> NamePromptView {
        
        let router: NamePromptRouter = NamePromptRouter()
        let viewModel: NamePromptViewModel = NamePromptViewModel(router: router, points: points)
        let view: NamePromptView = NamePromptView(viewModel: viewModel)

        return view
    }
    
}
