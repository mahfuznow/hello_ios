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
    
    @MainActor
    func injectDependencies() {
        injectApiClient()
        injectApiService()
        injectLocalService()
        injectRepositories()
    }
    
    private func injectApiClient() {
        registerSingleton(ApiClient.self, instance: ApiClientImpl())
    }
    
    private func injectApiService() {
        registerSingleton(ApiService.self, instance: ApiServiceImpl(apiClient: resolve(ApiClient.self)!))
    }
    
    @MainActor
    private func injectLocalService() {
        registerSingleton(LocalService.self, instance: LocalServiceImpl())
    }
    
    private func injectRepositories() {
        registerSingleton(
            MovieRepository.self,
            instance: MovieRepositoryImpl(
                apiService: resolve(ApiService.self)!,
                localService: resolve(LocalService.self)!
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
    
    private func registerInstance<T>(_ type: T.Type, instance: T) {
        do {
            try DiContainer.shared.register(type: type, instance: instance)
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
