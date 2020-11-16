//
//  FavoriteView.swift
//  Nonton
//
//  Created by IT Division on 16/11/20.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var presenter: FavoritePresenter

    var body: some View {
        NavigationView {
            if self.presenter.movies?.count != nil && self.presenter.movies?.count ?? 0 > 0 {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(self.presenter.movies!) { movie in
                    ZStack {
                        self.presenter.viewBuilder(movieData: movie) {
                            MovieRow(movie: movie)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }.navigationBarTitle("Favorite Movies", displayMode: .large)
            } else {
                Text("No Favorite Movies Yet. Try Adding Some First!")
                    .font(.headline).navigationBarTitle("Favorite Movies", displayMode: .large)
            }
        }
        .onAppear(perform: {
            self.presenter.getFavoriteMovies()
        })
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(presenter: FavoritePresenter(useCase: Injector.shared.injectFavoriteInteractor()))
    }
}
