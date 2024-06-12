import SwiftUI

struct MovieSearchScreen: View {
    
    @State private var viewModel = MovieSearchViewModel(
        movieRepository: try! DiContainer.shared.resolve(type: MovieRepository.self),
        navigationViewModel: NavigationViewModel.shared
    )
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.movieList) { movie in
                        SearchMovieListItemView(
                            movie: movie,
                            onClicked: {
                                viewModel.onClickedMovieItem(movieId: movie.id)
                            },
                            onAddToFavourite: {
                                viewModel.addToFavourite(movie: movie)
                            }
                        )
                    }
                }.refreshable {
                    viewModel.onRefresh()
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

fileprivate struct SearchMovieListItemView: View {
    let movie: MovieListItemModel
    let onClicked: () -> Void
    let onAddToFavourite: () -> Void
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: movie.poster)) { phase in
                ZStack {
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                    } else if phase.error != nil {
                        // Error view (optional)
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 180)
                            .foregroundColor(.gray)
                    } else {
                        // Placeholder with progress indicator
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 100, height: 180)
                            .overlay(
                                ProgressView()
                            )
                            .scaledToFit()
                    }
                }
            }.onTapGesture {
                onClicked()
            }
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("\(movie.releaseYear)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }.onTapGesture {
                    onClicked()
                }
                
                Button(action: onAddToFavourite) {
                    HStack {
                        Image(systemName: "heart")
                        Text("Add to Favourite")
                    }
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .padding(.top, 5)
                }
            }
        }
    }
}

#Preview {
    MovieSearchScreen()
}
