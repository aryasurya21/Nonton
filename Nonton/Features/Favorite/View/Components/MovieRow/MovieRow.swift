//
//  MovieRow.swift
//  Nonton
//
//  Created by IT Division on 16/11/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieRow: View {
    var movie: MovieModel

    var body: some View {
        VStack {
            WebImage(url: movie.backdropURL)
                .resizable()
                .indicator(.activity)
                .aspectRatio(16/9, contentMode: .fit)
            HStack(alignment: .top) {
                Text(movie.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Text(movie.formattedRating)
                    .font(.title)
                    .fontWeight(.bold)
                Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
            }.padding([.leading, .trailing], 10)
        }.cornerRadius(6)
        .shadow(radius: 10)
        .padding()
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(movie: MovieModel(id: 0, title: "Naruto", backdropPath: "https://i.pinimg.com/originals/71/73/59/71735901596a554a253359909bb39266.jpg", posterPath: "", overview: "", voteAverage: 0, runtime: 0, movieCategory: "", releaseDate: "", isFavorite: true))
    }
}
