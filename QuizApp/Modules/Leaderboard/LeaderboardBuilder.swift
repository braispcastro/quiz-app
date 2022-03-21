//
//  LeaderboardBuilder.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation

final class LeaderboardBuilder {
    
    static func build() -> LeaderboardView {
        
        let viewModel: LeaderboardViewModel = LeaderboardViewModel()
        let view: LeaderboardView = LeaderboardView(viewModel: viewModel)

        return view
    }
    
}
