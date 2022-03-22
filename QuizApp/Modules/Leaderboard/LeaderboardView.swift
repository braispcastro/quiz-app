//
//  LeaderboardView.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import SwiftUI

struct LeaderboardView: View {
    
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewModel: LeaderboardViewModel
    
    var body: some View {
        ZStack {
            List {
                ForEach(viewModel.viewObject.ranking) { rank in
                    HStack {
                        Text("\(rank.id + 1).")
                        Text(rank.name)
                        Spacer()
                        Text(String(rank.points))
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
            }
            .navigationTitle("Puntuaciones")
            .listStyle(.plain)
        }
        .onAppear {
            viewModel.onAppear(presentation)
        }
        .padding(16)
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

struct LeaderboardView_Previews: PreviewProvider {
    
    static var previews: some View {
        LeaderboardBuilder.build()
            .preferredColorScheme(.dark)
    }
    
}
