//
//  MenuBuilder.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation

final class MenuBuilder {
    
    static func build() -> MenuView {
        
        let router: MenuRouter = MenuRouter()
        let viewModel: MenuViewModel = MenuViewModel(router: router)
        let view: MenuView = MenuView(viewModel: viewModel)

        return view
    }
    
}
