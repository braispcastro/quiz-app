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
                    Text(viewModel.viewObject.play)
                }
                NavigationLink(destination: viewModel.showLeaderboardView) {
                    Text(viewModel.viewObject.leaderboard)
                }
                NavigationLink(destination: viewModel.showSettingsView) {
                    Text(viewModel.viewObject.settings)
                }
            }
            .navigationBarHidden(true)
            .onAppear(perform: viewModel.onAppear)
            .onDisappear(perform: viewModel.onDisappear)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    
    static var previews: some View {
        MenuBuilder.build()
    }
    
}
