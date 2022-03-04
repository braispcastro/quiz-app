//
//  LeaderboardView.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import SwiftUI

struct LeaderboardView: View {
    
    @ObservedObject var viewModel: LeaderboardViewModel
    
    var body: some View {
        Text("LeaderboardView")
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    
    static var previews: some View {
        LeaderboardBuilder.build()
    }
    
}
