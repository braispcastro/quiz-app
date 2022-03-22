//
//  MainButton.swift
//  QuizApp
//
//  Created by Brais Castro on 17/3/22.
//

import SwiftUI

enum MainButtonType {
    case primary
    case secondary
    case correct
    case incorrect
}

struct MainButtonStyle: ButtonStyle {
    
    let cornerRadius: CGFloat
    let buttonType: MainButtonType
    
    init(cornerRadius: CGFloat = 8, buttonType: MainButtonType = .primary) {
        self.cornerRadius = cornerRadius
        self.buttonType = buttonType
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(12)
            .contentShape(RoundedRectangle(cornerRadius: cornerRadius))
            .background(
                Group {
                    switch buttonType {
                    case .primary:
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(Color.customGray)
                    case .secondary:
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(Color.customBlue)
                    case .correct:
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(Color.customGreen)
                    case .incorrect:
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(Color.customRed)
                    }
                }
            )
            .overlay(
                Group {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(lineWidth: 1)
                        .foregroundColor(Color.white)
                }
            )
            .foregroundColor(Color.white)
            .font(.headline)
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            Button(action: {
                print("Icon button style")
            }) {
                Image.init(systemName: "heart.fill")
            }
            .buttonStyle(MainButtonStyle(buttonType: .primary))
            
            Button(action: {
                print("Icon button style")
            }) {
                HStack {
                    Image.init(systemName: "flag")
                    Text("SURRENDER")
                }
            }
            .buttonStyle(MainButtonStyle(buttonType: .primary))
            
            Button(action: {
                print("Normal button style")
            }) {
                Text("Normal button style")
            }
            .buttonStyle(MainButtonStyle(buttonType: .primary))
            
            Button(action: {
                print("Selected button style")
            }) {
                Text("Selected button style")
            }
            .buttonStyle(MainButtonStyle(buttonType: .secondary))
            
            Button(action: {
                print("Correct button style")
            }) {
                Text("Correct button style")
            }
            .buttonStyle(MainButtonStyle(buttonType: .correct))
            
            Button(action: {
                print("Incorrect button style")
            }) {
                Text("Incorrect button style")
            }
            .buttonStyle(MainButtonStyle(buttonType: .incorrect))
        }
        .preferredColorScheme(.dark)
        .padding(15)
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
