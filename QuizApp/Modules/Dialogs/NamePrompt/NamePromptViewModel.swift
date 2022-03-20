//
//  NamePromptViewModel.swift
//  QuizApp
//
//  Created by Brais Castro on 19/3/22.
//

import Foundation
import SwiftUI

protocol NamePromptViewModelProtocol {
    func onAppear(_ presentation: Binding<PresentationMode>)
    func onDisappear()
    func confirmTapped()
}

final class NamePromptViewModel: ObservableObject {
    
    @Published var viewObject: NamePrompt.ViewObject!
    
    private var presentation: Binding<PresentationMode>!
    private let points: Int
    
    private let router: NamePromptRouter!
    
    init(router: NamePromptRouter, points: Int) {
        self.points = points
        self.router = router
        prepareView()
    }
    
    private func prepareView() {
        viewObject = NamePrompt.ViewObject()
        viewObject.message = "¡Has conseguido \(points) puntos!"
    }
    
    // MARK: - Private Methods
    
}

extension NamePromptViewModel: NamePromptViewModelProtocol {
    
    func onAppear(_ presentation: Binding<PresentationMode>) {
        self.presentation = presentation
    }
    
    func onDisappear() {
        
    }
    
    func confirmTapped() {
        let name = viewObject.name.trimmingCharacters(in: .whitespacesAndNewlines)
        if name.count > 0 {
            RankingManager.shared.saveGameToRanking(name: name, points: points)
            presentation.wrappedValue.dismiss()
        }
    }
    
}
