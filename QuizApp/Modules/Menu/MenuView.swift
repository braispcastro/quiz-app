//
//  MenuView.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var viewModel: MenuViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                Text(viewModel.viewObject.title)
                Spacer()
                NavigationLink(destination: viewModel.showGameView) {
                    HStack {
                        Spacer()
                        Text(viewModel.viewObject.play)
                        Spacer()
                    }
                }
                .modifier(MainNavigationStyle())
                NavigationLink(destination: viewModel.showLeaderboardView) {
                    HStack {
                        Spacer()
                        Text(viewModel.viewObject.leaderboard)
                        Spacer()
                    }
                }
                .modifier(MainNavigationStyle())
            }
            .navigationBarHidden(true)
            .padding(16)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    
    static var previews: some View {
        MenuBuilder.build()
    }
    
}
