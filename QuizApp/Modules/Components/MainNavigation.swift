//
//  MainNavigation.swift
//  QuizApp
//
//  Created by Brais Castro on 17/3/22.
//

import SwiftUI

struct MainNavigationStyle: ViewModifier {
    
    let cornerRadius: CGFloat
    
    init(cornerRadius: CGFloat = 8) {
        self.cornerRadius = cornerRadius
    }
    
    func body(content: Content) -> some View {
        content
            .padding(12)
            .contentShape(RoundedRectangle(cornerRadius: cornerRadius))
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.customGray)
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: 1)
                    .foregroundColor(Color.white)
            )
            .foregroundColor(Color.white)
            .font(.headline)
    }
}

struct MainNavigation_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            Text("PLAY")
                .modifier(MainNavigationStyle())
        }
        .preferredColorScheme(.light)
        .padding(15)
    }
}
