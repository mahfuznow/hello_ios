//
//  MovieListScreen.swift
//  hello_ios
//
//  Created by BS1002 on 22/5/24.
//

import Foundation
import SwiftUI

struct MovieListScreen : View {
    var viewModel: MovieViewModel = MovieViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                
                if(viewModel.movieList.isEmpty) {
                    ProgressView()
                }
                else {
                    MovieSlider(movieList: Array(viewModel.movieList[1...3]))
                    Text("Newly Released").font(.title2)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(viewModel.movieList) { movie in
                                MovieCard(movie: movie)
                            }
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    }
                    Text("Most Popular Movies").font(.title2)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(viewModel.movieList) { movie in
                                MovieCard(movie: movie)
                            }
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    }
                }
            }.padding()
        }
    }
}

struct MovieCard: View {
    var movie: MovieListItemModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            AsyncImage(url: URL(string: movie.poster)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 225)
                    .clipped()
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            
            Text(movie.title)
                .font(.headline)
                .lineLimit(1)
                .padding(.top, 5)
            
            Text("\(movie.releaseYear)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(width: 150)
        .padding(.leading, 10)
        .padding(.trailing, 10)
    }
}

#Preview {
    MovieListScreen()
}
