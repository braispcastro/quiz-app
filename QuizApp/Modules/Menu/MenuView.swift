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
            ZStack {
                VStack(spacing: 16) {
                    Text(viewModel.viewObject.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
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
            .background(
                ZStack {
                    Image("Hogwarts")
                        .resizable()
                        .scaledToFill()
                    
                    Color.black.opacity(0.5)
                }
                .ignoresSafeArea()
            )
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    
    static var previews: some View {
        MenuBuilder.build()
            .preferredColorScheme(.dark)
    }
    
}
