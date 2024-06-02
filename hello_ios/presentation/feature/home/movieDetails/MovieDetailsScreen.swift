//
//  MovieDetailsScreen.swift
//  hello_ios
//
//  Created by BS1002 on 23/5/24.
//


import Foundation
import SwiftUI

struct MovieDetailsScreen: View {
    let movieId: Int
    
    @State private var viewmodel: MovieDetailsViewModel = MovieDetailsViewModel(
        movieRepository: try! DiContainer.shared.resolve(type:MovieRepository.self)
    )
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    var body: some View {
        Group {
            if let movie = viewmodel.movieDetails {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        MovieCoverImageView(url: movie.largeCoverImage)
                        MovieTitleAndYearView(title: movie.title, year: movie.releaseYear)
                        MovieRatingView(rating: movie.rating)
                        MovieGenresView(genres: movie.genres)
                        MovieDurationAndDescriptionView(duration: movie.duration, description: movie.description)
                    }
                    .padding()
                }
                .navigationBarTitle(Text(movie.title), displayMode: .inline)
            } else {
                ProgressView()
            }
        }.onAppear() {
            viewmodel.getMovieDetails(movieId: movieId)
        }
    }
}

fileprivate struct MovieCoverImageView: View {
    let url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure:
                Image(systemName: "xmark.octagon.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.red)
            @unknown default:
                EmptyView()
            }
        }
    }
}

fileprivate struct MovieTitleAndYearView: View {
    let title: String
    let year: Int
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(year)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

fileprivate struct MovieRatingView: View {
    let rating: Double
    
    var body: some View {
        HStack {
            ForEach(0..<5) { star in
                Image(systemName: star < Int(rating.rounded()) ? "star.fill" : "star")
                    .foregroundColor(star < Int(rating.rounded()) ? .yellow : .gray)
            }
            Text(String(format: "%.1f", rating))
                .foregroundColor(.gray)
                .font(.subheadline)
        }
    }
}

fileprivate struct MovieGenresView: View {
    let genres: [MovieGenre]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(genres.indices, id: \.self) { index in
                    Text(genres[index].toString())
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

fileprivate struct MovieDurationAndDescriptionView: View {
    let duration: Int
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Duration: \(duration) min")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(description)
                .font(.body)
        }
    }
}
