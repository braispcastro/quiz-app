//
//  NamePromptView.swift
//  QuizApp
//
//  Created by Brais Castro on 19/3/22.
//

import SwiftUI

struct NamePromptView: View {
    
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewModel: NamePromptViewModel
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            
            VStack {
                Image(systemName: "hands.clap.fill")
                    .font(.largeTitle)
                    .padding(.bottom, 8)
                    .foregroundColor(.init(hex: "#FCD0B4"))
                Text(viewModel.viewObject.message)
                Spacer()
                HStack {
                    TextField("Escribe tu nombre", text: $viewModel.viewObject.name)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .cornerRadius(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(lineWidth: 2)
                                .foregroundColor(Color.blueStart)
                        )
                    Button(action: viewModel.confirmTapped) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.blueStart)
                            .font(.system(size: 28))
                    }
                }
            }
            .padding(40)
            .frame(width: UIScreen.main.bounds.width - 50, height: 250)
            .background(Color.white)
            .foregroundColor(Color.black)
            //.clipped()
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 4)
                    .foregroundColor(Color.blueStart)
            )
        }
        .onAppear {
            viewModel.onAppear(presentation)
        }
        .onDisappear(perform: viewModel.onDisappear)
    }
}

struct NamePromptView_Previews: PreviewProvider {
    static var previews: some View {
        NamePromptBuilder.build(points: "50")
    }
}
