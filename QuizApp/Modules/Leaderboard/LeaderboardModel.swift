//
//  LeaderboardModel.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import Foundation

struct Leaderboard {
    
    struct ViewObject {
        var ranking: [Rank]
        
        init() {
            ranking = []
        }
    }
    
    struct Rank: Codable, Hashable, Identifiable {
        var id: Int
        var name: String
        var points: Int
    }
    
}
