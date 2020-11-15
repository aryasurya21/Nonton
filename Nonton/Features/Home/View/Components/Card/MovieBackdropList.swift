//
//  MovieBackdropList.swift
//  Nonton
//
//  Created by IT Division on 14/11/20.
//

import SwiftUI

struct MovieBackdropList: View {
    let title: String
    let movies: [MovieModel]

    var body: some View {
        VStack(alignment: .leading) {
            Text(self.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.movies) { movie in
                        MovieBackdrop(movie: movie)
                            .frame(width: 250, height: 190)
                        .buttonStyle(PlainButtonStyle())
                        .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                        .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                    }
                }
            }
        }
    }
}

struct MovieBackdropList_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropList(title: "Upcoming", movies: [MovieModel(id: 012345, title: "Uzumaki Saburo", backdropPath: "", posterPath: "https://i.pinimg.com/originals/71/73/59/71735901596a554a253359909bb39266.jpg", overview: "Cucu Uzumaki Narutp", voteAverage: 9.0, voteCount: 130, runtime: 2, movieCategory: "now_playing"), MovieModel(id: 012345, title: "Uzumaki Saburo", backdropPath: "", posterPath: "https://i.pinimg.com/originals/71/73/59/71735901596a554a253359909bb39266.jpg", overview: "Cucu Uzumaki Narutp", voteAverage: 9.0, voteCount: 130, runtime: 2, movieCategory: "now_playing")])
    }
}
