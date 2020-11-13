//
//  HomeView.swift
//  Nonton
//
//  Created by IT Division on 13/11/20.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @ObservedObject var presenter: HomePresenter
    
    var body: some View {
        NavigationView {
            List {
                
            }.navigationBarTitle("Nonton Yuk!")
        }.onAppear(perform: {
            self.presenter.getMovies(for: .nowPlaying)
            self.presenter.getMovies(for: .popular)
            self.presenter.getMovies(for: .topRated)
            self.presenter.getMovies(for: .upcoming)
        })
    }
}
