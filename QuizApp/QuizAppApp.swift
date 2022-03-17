//
//  QuizAppApp.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import SwiftUI

@main
struct QuizAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            MenuBuilder.build()
                .preferredColorScheme(.light)
        }
    }
    
}
