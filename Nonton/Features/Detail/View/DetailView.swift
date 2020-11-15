//
//  DetailView.swift
//  Nonton
//
//  Created by IT Division on 15/11/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    @ObservedObject var presenter: DetailPresenter

    var body: some View {
        ScrollView {
            VStack {
                WebImage(url: self.presenter.movieData?.backdropURL)
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(16/9, contentMode: .fit)
                HStack {
                    Text(self.presenter.movieData?.title ?? "")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "heart")
                        .padding()
                        .overlay(
                            Circle()
                                .stroke(Color.gray, lineWidth: 4)
                        )
                }.padding()
                Text(self.presenter.movieData?.overview ?? "")
                    .font(.body)
                    .padding()
                Divider()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Release Date")
                            .font(.title)
                            .fontWeight(.bold)
                        Text(self.presenter.movieData?.formattedReleaseDate ?? "To be announced.")
                    }
                    Spacer()
                }.padding()
                Divider()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Duration")
                            .font(.title)
                            .fontWeight(.bold)
                        Text(self.presenter.movieData?.formattedDuration ?? "-")
                    }
                    Spacer()
                }.padding()
                Divider()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Rating")
                            .font(.title)
                            .fontWeight(.bold)
                        HStack {
                            Text("\(self.presenter.movieData?.formattedRating ?? "")")
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        }
                    }
                    Spacer()
                }.padding()
                Spacer()
            }
        }.navigationBarTitle(self.presenter.movieData?.title ?? "Movie Detail", displayMode: .inline)
        .onAppear {
            self.presenter.getMovieDetail()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(presenter: DetailPresenter(useCase: Injector.shared.injectDetailInteractor(), movieID: 1))
    }
}
