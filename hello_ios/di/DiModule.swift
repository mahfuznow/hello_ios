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
        injectRepositories()
    }
    
    private func injectRepositories() {
        registerSingleton(MovieRepository.self, instance: MovieRepositoryImpl())
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
