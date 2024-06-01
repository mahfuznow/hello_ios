//
//  MovieSearchScreen.swift
//  hello_ios
//
//  Created by BS1002 on 1/6/24.
//

import SwiftUI

struct MovieSearchScreen: View {
    @State private var viewModel = try! DiContainer.shared.resolve(type: MovieSearchViewModel.self)
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.movieList) { movie in
                        NavigationLink(
                            destination: MovieDetailsScreen(movieId: movie.id),
                            label: {
                                HStack {
                                    AsyncImage(url: URL(string: movie.poster)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    VStack(alignment: .leading) {
                                        Text(movie.title)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                        Text("\(movie.releaseYear)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        )
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $viewModel.searchQuery)
            .onSubmit(of: .search) {
                viewModel.onSearchSubmit()
            }
        }
    }
}

#Preview {
    MovieSearchScreen()
}
