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
                Text("Quiz app!")
                Spacer()
                NavigationLink(destination: viewModel.showGameView) {
                    Text("JUGAR")
                }
                NavigationLink(destination: viewModel.showLeaderboardView) {
                    Text("PUNTUACIONES")
                }
                NavigationLink(destination: viewModel.showSettingsView) {
                    Text("OPCIONES")
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
