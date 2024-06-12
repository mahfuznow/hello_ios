import SwiftUI

struct FavouriteMoviesScreen: View {
    
    @State private var viewModel = FavouriteMoviesViewModel(
        movieRepository: try! DiContainer.shared.resolve(type: MovieRepository.self),
        navigationViewModel: NavigationViewModel.shared
    )
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.movieList) { movie in
                        FavouriteMovieListItemView(
                            movie: movie,
                            onClicked: {
                                viewModel.onClickedMovieItem(movieId: movie.id)
                            }
                        )
                    }
                    .onDelete(perform: { indexSet in
                        viewModel.onDeleteMovieItem(indexSet: indexSet)
                    })
                }
            }
            .navigationTitle("Favourite")
        }.onAppear {
            viewModel.fetchMovieList()
        }
    }
}

fileprivate struct FavouriteMovieListItemView: View {
    let movie: MovieListItemModel
    let onClicked: () -> Void
    
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
        .onTapGesture {
            onClicked()
        }
    }
}

#Preview {
    FavouriteMoviesScreen()
}
