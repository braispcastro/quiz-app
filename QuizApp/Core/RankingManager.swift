//
//  RankingManager.swift
//  QuizApp
//
//  Created by Brais Castro on 19/3/22.
//

import Foundation

final class RankingManager {
    
    static let shared = RankingManager()
    
    // MARK: Private Methods
    
    private func buildEmptyRanking() -> [Leaderboard.Rank] {
        guard let path = Bundle.main.path(forResource: "ranking", ofType: "json") else {
            fatalError("Check ranking.json file")
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let r = try JSONDecoder().decode([Leaderboard.Rank].self, from: data)
            UserDefaultsProvider.setCodable(key: .ranking, value: r)
            return getRankingFromMemory()
        } catch {
            fatalError("Check ranking.json file")
        }
    }
    
    // MARK: Public Methods
    
    func getRankingFromMemory() -> [Leaderboard.Rank] {
        guard let ranking: [Leaderboard.Rank] = UserDefaultsProvider.codable(key: .ranking) else {
            return buildEmptyRanking()
        }
        
        return ranking
    }
    
    func saveGameToRanking(name: String, points: Int) {
        var ranking = getRankingFromMemory()
        ranking.append(Leaderboard.Rank(id: -1, name: name, points: points))
        var newRanking = Array(ranking.sorted(by: { $0.points > $1.points }).prefix(10))
        for i in newRanking.indices {
            newRanking[i] = Leaderboard.Rank(id: i,
                                             name: newRanking[i].name,
                                             points: newRanking[i].points)
        }
        UserDefaultsProvider.setCodable(key: .ranking, value: newRanking)
    }
    
}
