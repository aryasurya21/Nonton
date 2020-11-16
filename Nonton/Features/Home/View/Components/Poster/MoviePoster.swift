//
//  MoviePoster.swift
//  Nonton
//
//  Created by IT Division on 14/11/20.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct MoviePoster: View {
    let movie: MovieModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            WebImage(url: movie.posterImageURL)
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .cornerRadius(8)
                .shadow(radius: 5)
                .frame(width: 170, height: 250, alignment: .center)
            Text(movie.title)
                .foregroundColor(Color.black)
                .font(.subheadline)
                .fontWeight(.bold)

        }
    }
}

struct MoviePoster_Previews: PreviewProvider {
    static var previews: some View {
        MoviePoster(movie: MovieModel(id: 012345, title: "Uzumaki Saburo", backdropPath: "", posterPath: "https://i.pinimg.com/originals/71/73/59/71735901596a554a253359909bb39266.jpg", overview: "Cucu Uzumaki Narutp", voteAverage: 9.0, runtime: 2, movieCategory: "now_playing", releaseDate: "2020-10-13", isFavorite: true))
    }
}
