//
//  MoviePosterList.swift
//  Nonton
//
//  Created by IT Division on 14/11/20.
//

import SwiftUI

struct MoviePosterList: View {
    let movies: [MovieModel]
    let title: String
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            Text(self.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top, spacing: 20.0) {
                    ForEach(self.movies){ movie in
                        NavigationLink(
                            destination: Text("Destination")
                            ){
                            MoviePoster(movie: movie)
                                .buttonStyle(PlainButtonStyle())
                        }.padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                        .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                    }
                }
            })
        }
    }
}

struct MoviePosterList_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterList(movies: [MovieModel(id: 012345, title: "Uzumaki Saburo", backdropPath: "", posterPath: "https://i.pinimg.com/originals/71/73/59/71735901596a554a253359909bb39266.jpg", overview: "Cucu Uzumaki Narutp", voteAverage: 9.0, voteCount: 130, runtime: 2, movieCategory: "now_playing"),MovieModel(id: 012345, title: "Uzumaki Saburo", backdropPath: "", posterPath: "https://i.pinimg.com/originals/71/73/59/71735901596a554a253359909bb39266.jpg", overview: "Cucu Uzumaki Narutp", voteAverage: 9.0, voteCount: 130, runtime: 2, movieCategory: "now_playing")], title: "Now Playing")
    }
}
