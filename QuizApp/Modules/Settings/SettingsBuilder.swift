//
//  SettingsBuilder.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation

final class SettingsBuilder {
    
    static func build() -> SettingsView {
        
        let viewModel: SettingsViewModel = SettingsViewModel()
        let view: SettingsView = SettingsView(viewModel: viewModel)

        return view
    }
    
}
