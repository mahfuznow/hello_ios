//
//  MovieListScreen.swift
//  hello_ios
//
//  Created by BS1002 on 22/5/24.
//

import Foundation
import SwiftUI

struct MovieListScreen : View {
    @State var viewModel: MovieViewModel = MovieViewModel()
    
    var body: some View {
        VStack {
            Text("Movie List \(viewModel.movieList.count)")
            List {
                ForEach($viewModel.movieList, id: \.id) { movie in
                    MovieListItemView(movie: movie)
                }
            }
        }
    }
}


struct MovieListItemView: View {
  @Binding var movie: MovieListItemModel
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: movie.poster)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text("Title: \(movie.title)")
                Text("Release Year: \(movie.releaseYear)")
            }
            .onTapGesture {
                print("Movie: \(movie.title) clicked")
            }
        }
    }
}

#Preview {
    MovieListScreen()
}
