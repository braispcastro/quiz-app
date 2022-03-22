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
                }
            }
            .navigationTitle("Puntuaciones")
            .listStyle(.plain)
        }
        .onAppear {
            viewModel.onAppear(presentation)
        }
        .padding(16)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    
    static var previews: some View {
        LeaderboardBuilder.build()
    }
    
}
