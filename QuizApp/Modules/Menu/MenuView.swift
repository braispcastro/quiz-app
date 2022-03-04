//
//  MenuView.swift
//  QuizApp
//
//  Created by Brais Castro on 4/3/22.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var viewModel: MenuViewModel
    
    var body: some View {
        Text("MenuView")
    }
}

struct MenuView_Previews: PreviewProvider {
    
    static var previews: some View {
        MenuBuilder.build()
    }
    
}
