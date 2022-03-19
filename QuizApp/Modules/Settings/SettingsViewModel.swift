//
//  SettingsViewModel.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation

protocol SettingsViewModelProtocol {
    func onAppear()
    func onDisappear()
}

final class SettingsViewModel: ObservableObject {
    
    @Published var viewObject: Settings.ViewObject!
    
    private let router: SettingsRouter!
    
    init(router: SettingsRouter) {
        self.router = router
    }
    
    // MARK: - Private Methods
    
}

extension SettingsViewModel: SettingsViewModelProtocol {
    
    func onAppear() {
        
    }
    
    func onDisappear() {
        
    }
    
}
