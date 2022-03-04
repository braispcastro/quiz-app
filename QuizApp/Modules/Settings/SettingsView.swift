//
//  SettingsView.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        Text("SettingsView")
    }
}

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsBuilder.build()
    }
    
}
