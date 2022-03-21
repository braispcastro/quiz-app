//
//  SettingsViewModel.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation

protocol SettingsViewModelProtocol {
    
}

final class SettingsViewModel: ObservableObject {
    
    @Published var viewObject: Settings.ViewObject!
    
    init() {
        
    }
    
    // MARK: - Private Methods
    
}

extension SettingsViewModel: SettingsViewModelProtocol {
    
}
