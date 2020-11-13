//
//  ContentView.swift
//  Nonton
//
//  Created by IT Division on 13/11/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var homePresenter: HomePresenter
    
    var body: some View {
        TabView {
            HomeView(presenter: homePresenter)
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }.tag(0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
