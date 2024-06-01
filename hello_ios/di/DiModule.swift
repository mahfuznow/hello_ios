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
        do {
            try DiContainer.shared.registerSingleton(
                type: NavigationViewModel.self,
                instance: NavigationViewModel()
            )
        } catch {
            print("Failed to register navigation: \(error)")
        }
    }
    
    private func injectRepositories() {
        do {
            try DiContainer.shared.registerSingleton(
                type: MovieRepository.self,
                instance: MovieRepositoryImpl()
            )
        } catch {
            print("Failed to register repositories: \(error)")
        }
    }
    
    private func injectViewModels() {
        do {
            try DiContainer.shared.registerSingleton(
                type: HomeViewModel.self,
                instance: HomeViewModel()
            )
            try DiContainer.shared.registerSingleton(
                type: MovieListViewModel.self,
                instance: MovieListViewModel(
                    movieRepository: try DiContainer.shared.resolve(type: MovieRepository.self),
                    navigationViewModel: try DiContainer.shared.resolve(type: NavigationViewModel.self)
                )
            )
            
            try DiContainer.shared.registerSingleton(
                type: MovieDetailsViewModel.self,
                instance: MovieDetailsViewModel(movieRepository: try DiContainer.shared.resolve(type: MovieRepository.self))
            )
            
            try DiContainer.shared.registerSingleton(
                type: MovieSearchViewModel.self,
                instance: MovieSearchViewModel(movieRepository: try DiContainer.shared.resolve(type: MovieRepository.self))
            )
        } catch {
            print("Failed to register view models: \(error)")
        }
        
    }
    
}
