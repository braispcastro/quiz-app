//
//  NamePromptBuilder.swift
//  QuizApp
//
//  Created by Brais Castro on 19/3/22.
//

import Foundation

final class NamePromptBuilder {
    
    static func build(points: Int, isShown: Bool, onDone: @escaping (String) -> Void) -> NamePromptView {
        
        let viewModel: NamePromptViewModel = NamePromptViewModel(points: points,
                                                                 isShown: isShown,
                                                                 onDone: onDone)
        let view: NamePromptView = NamePromptView(viewModel: viewModel)

        return view
    }
    
}
