//
//  AppModule.swift
//  hello_ios
//
//  Created by BS1002 on 27/5/24.
//

import Foundation

class DiModule {
    
    static let shared = DiModule()
    
    private init() {}
    
    func injectDependencies() {
        injectNavigation()
        injectRepositories()
        injectViewModels()
    }
    
    private func injectNavigation() {
        registerSingleton(NavigationViewModel.self, instance: NavigationViewModel())
    }
    
    private func injectRepositories() {
        registerSingleton(MovieRepository.self, instance: MovieRepositoryImpl())
    }
    
    private func injectViewModels() {
        guard let movieRepository: MovieRepository = resolve(MovieRepository.self),
              let navigationViewModel: NavigationViewModel = resolve(NavigationViewModel.self) else {
            print("Failed to resolve dependencies for view models")
            return
        }

        registerSingleton(
            HomeViewModel.self,
            instance: HomeViewModel()
        )
        registerSingleton(
            MovieListViewModel.self,
            instance: MovieListViewModel(
                movieRepository: movieRepository,
                navigationViewModel: navigationViewModel
            )
        )
        registerSingleton(
            MovieDetailsViewModel.self,
            instance: MovieDetailsViewModel(
                movieRepository: movieRepository
            )
        )
        registerSingleton(
            MovieSearchViewModel.self,
            instance: MovieSearchViewModel(
                movieRepository: movieRepository
            )
        )
    }
    
    private func registerSingleton<T>(_ type: T.Type, instance: T) {
        do {
            try DiContainer.shared.registerSingleton(type: type, instance: instance)
        } catch {
            print("Failed to register singleton \(type): \(error)")
        }
    }
    
    private func registerInstance<T>(_ type: T.Type, factory: @escaping () -> T) {
        do {
            try DiContainer.shared.register(type: type, instance: factory())
        } catch {
            print("Failed to register instance \(type): \(error)")
        }
    }
    
    private func resolve<T>(_ type: T.Type) -> T? {
        do {
            return try DiContainer.shared.resolve(type: type)
        } catch {
            print("Failed to resolve \(type): \(error)")
            return nil
        }
    }
}
