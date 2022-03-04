//
//  GameView.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        Text("GameView")
    }
}

struct GameView_Previews: PreviewProvider {
    
    static var previews: some View {
        GameBuilder.build()
    }
    
}
