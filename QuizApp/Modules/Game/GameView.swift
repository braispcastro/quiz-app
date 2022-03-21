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
        ZStack {
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
                        HStack {
                            Image(systemName: "flag")
                        }
                    }
                    .buttonStyle(MainButtonStyle(buttonType: .primary))
                }
                Text(viewModel.viewObject.question)
                Spacer()
                Text(viewModel.viewObject.timeLeft)
                    .font(.system(size: 64))
                VStack(spacing: 8) {
                    Button(action: {
                        viewModel.answerTapped(index: 0)
                    }) {
                        HStack {
                            Spacer()
                            Text(viewModel.viewObject.buttons[0].title)
                                .fontWeight(.bold)
                            Spacer()
                        }
                    }
                    .buttonStyle(MainButtonStyle(buttonType: viewModel.viewObject.buttons[0].style))
                    
                    Button(action: {
                        viewModel.answerTapped(index: 1)
                    }) {
                        HStack {
                            Spacer()
                            Text(viewModel.viewObject.buttons[1].title)
                                .fontWeight(.bold)
                            Spacer()
                        }
                    }
                    .buttonStyle(MainButtonStyle(buttonType: viewModel.viewObject.buttons[1].style))
                    
                    Button(action: {
                        viewModel.answerTapped(index: 2)
                    }) {
                        HStack {
                            Spacer()
                            Text(viewModel.viewObject.buttons[2].title)
                                .fontWeight(.bold)
                            Spacer()
                        }
                    }
                    .buttonStyle(MainButtonStyle(buttonType: viewModel.viewObject.buttons[2].style))
                    
                }
                .disabled(viewModel.viewObject.isAnswerDisabled)
            }
            .padding(.horizontal, 16)
            
            viewModel.showNamePrompt()
        }
        .navigationBarHidden(true)
        .onAppear {
            viewModel.onAppear(presentation)
        }
        .onDisappear(perform: viewModel.onDisappear)
    }
}

struct GameView_Previews: PreviewProvider {
    
    static var previews: some View {
        GameBuilder.build()
    }
    
}
