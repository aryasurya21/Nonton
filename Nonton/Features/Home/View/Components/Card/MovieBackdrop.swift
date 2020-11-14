//
//  MovieCard.swift
//  Nonton
//
//  Created by IT Division on 14/11/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieBackdrop: View {
    var movie: MovieModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            WebImage(url: movie.backdropURL)
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .aspectRatio(16/9, contentMode: .fit)
                .cornerRadius(8)
                .shadow(radius: 4)
            Text(movie.title)
                .font(.subheadline)
                .fontWeight(.bold)
        }
    }
}

struct MovieBackdrop_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdrop(movie: MovieModel(id: 012345, title: "Uzumaki Saburo", backdropPath: "", posterPath: "https://i.pinimg.com/originals/71/73/59/71735901596a554a253359909bb39266.jpg", overview: "Cucu Uzumaki Narutp", voteAverage: 9.0, voteCount: 130, runtime: 2, movieCategory: "now_playing"))
    }
}
