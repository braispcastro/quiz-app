//
//  NamePromptViewModel.swift
//  QuizApp
//
//  Created by Brais Castro on 19/3/22.
//

import Foundation
import SwiftUI

protocol NamePromptViewModelProtocol {
    func confirmTapped()
}

final class NamePromptViewModel: ObservableObject {
    
    @Published var isShown: Bool!
    @Published var message: String!
    @Published var name: String!
    
    private var points: Int
    private var onDone: (String) -> Void = { _ in }
    
    init(points: Int, isShown: Bool, onDone: @escaping (String) -> Void) {
        self.points = points
        self.onDone = onDone
        self.isShown = isShown
        self.message = "¡Has conseguido \(points) puntos!"
        self.name = ""
    }
    
    // MARK: - Private Methods
}

extension NamePromptViewModel: NamePromptViewModelProtocol {
    
    func confirmTapped() {
        let name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        if name.count > 0 {
            onDone(name)
            isShown = false
        }
    }
    
}
