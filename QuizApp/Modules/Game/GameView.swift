//
//  GameView.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import SwiftUI

struct GameView: View {
    
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        VStack(spacing: 64) {
            ZStack {
                HStack {
                    VStack {
                        Text("Ronda")
                        Text(viewModel.viewObject.count)
                    }
                    Spacer()
                    VStack {
                        Text("Puntuación")
                        Text(viewModel.viewObject.totalPoints)
                    }
                }
                Button(action: viewModel.surrenderTapped) {
                    Text("RENDIRSE")
                }
            }
            Text(viewModel.viewObject.question)
            Spacer()
            Text(viewModel.viewObject.timeLeft)
            VStack(spacing: 8) {
                Button(action: {
                    viewModel.answerTapped(index: 0)
                }, label: {
                    Text(viewModel.viewObject.firstAnswer)
                })
                Button(action: {
                    viewModel.answerTapped(index: 1)
                }, label: {
                    Text(viewModel.viewObject.secondAnswer)
                })
                Button(action: {
                    viewModel.answerTapped(index: 2)
                }, label: {
                    Text(viewModel.viewObject.thirdAnswer)
                })
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            viewModel.onAppear(presentation)
        }
        .onDisappear(perform: viewModel.onDisappear)
        .padding(.horizontal, 16)
    }
}

struct GameView_Previews: PreviewProvider {
    
    static var previews: some View {
        GameBuilder.build()
    }
    
}
