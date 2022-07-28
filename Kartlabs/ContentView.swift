//
//  ContentView.swift
//  Kartlabs
//
//  Created by abhishek dhiman on 21/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabBarView(viewRouter: ViewRouter.init())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
