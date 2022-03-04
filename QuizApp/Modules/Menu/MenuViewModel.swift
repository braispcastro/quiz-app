//
//  MenuViewModel.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation

protocol MenuViewModelProtocol {
    func onAppear()
    func onDisappear()
}

final class MenuViewModel: MenuViewModelProtocol, ObservableObject {
    
    @Published var viewObject: Menu.ViewObject!
    
    private let router: MenuRouter!
    
    init(router: MenuRouter) {
        self.router = router
    }
    
    // MARK: - Public Methods
    
    func onAppear() {
        
    }
    
    func onDisappear() {
        
    }
    
    // MARK: - Private Methods
    
}
