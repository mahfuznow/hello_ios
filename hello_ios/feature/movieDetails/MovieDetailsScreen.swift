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
    
    @State private var viewmodel: MovieDetailsViewModel = try! DiContainer.shared.resolve(type: MovieDetailsViewModel.self)
    
    init(movieId: Int) {
        self.movieId = movieId
        viewmodel.getMovieDetails(movieId: movieId)
    }
    
    var body: some View {
        if let movie = viewmodel.movieDetails {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Cover Image
                    AsyncImage(url: URL(string: movie.largeCoverImage)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    // Title and Release Year
                    HStack {
                        Text(movie.title)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(movie.releaseYear)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    // Rating
                    HStack {
                        ForEach(0..<5) { star in
                            Image(systemName: star < Int(movie.rating.rounded()) ? "star.fill" : "star")
                                .foregroundColor(star < Int(movie.rating.rounded()) ? .yellow : .gray)
                        }
                        Text(String(format: "%.1f", movie.rating))
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    
                    // Genres
                    HStack {
                        ForEach(movie.genres.indices, id: \.self) { index in
                            Text(movie.genres[index].toString())
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.blue)
                                .cornerRadius(8)
                                .foregroundColor(.white)
                        }
                    }
                    
                    // Duration
                    Text("Duration: \(movie.duration) min")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    // Description
                    Text(movie.description)
                        .font(.body)
                }
                .padding()
            }
            .navigationBarTitle(Text(movie.title), displayMode: .inline)
        } else {
            ProgressView()
        }
    }
    
}
