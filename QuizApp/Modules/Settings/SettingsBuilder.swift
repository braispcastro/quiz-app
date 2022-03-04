//
//  SettingsBuilder.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation

final class SettingsBuilder {
    
    static func build() -> SettingsView {
        
        let router: SettingsRouter = SettingsRouter()
        let viewModel: SettingsViewModel = SettingsViewModel(router: router)
        let view: SettingsView = SettingsView(viewModel: viewModel)

        return view
    }
    
}
