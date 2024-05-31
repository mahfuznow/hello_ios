//
//  DependencyContainer.swift
//  hello_ios
//
//  Created by BS1002 on 31/5/24.
//

import Foundation

class DiContainer {
    static let shared = DiContainer()
    
    private var dependencies: [String: AnyObject] = [:]
    private var singletons: [String: AnyObject] = [:]
    
    /// Mark: - Explanation
    ///The DispatchQueue is used in this code to ensure thread safety when accessing shared resources, such as the dictionaries `dependencies` and `singletons`. By using a DispatchQueue with the `.concurrent` attribute and a barrier flag, concurrent access to these dictionaries is synchronized.
    ///In Swift, accessing shared resources from multiple threads concurrently can lead to race conditions, where the behavior of the program becomes unpredictable due to conflicting modifications of the shared data. To prevent such issues, synchronization mechanisms like DispatchQueue are employed to ensure that only one thread can access the shared resources at a time.
    ///Specifically, the `.sync(flags: .barrier)` method ensures that the block of code passed to it is executed atomically with respect to other accesses to the DispatchQueue. This means that while the block is being executed, no other blocks submitted to the same DispatchQueue can execute concurrently. The use of a barrier ensures that all previously submitted blocks are completed before the barrier block starts executing, and no blocks submitted after the barrier block start executing until the barrier block is finished.
    ///This ensures that modifications to the `dependencies` and `singletons` dictionaries are performed atomically, preventing potential data races and maintaining the consistency of the dependency container's state.
    private let queue = DispatchQueue(label: "DependencyContainerQueue", attributes: .concurrent)
    
    private init() {}
    
    // Register a new dependency instance
    func register<T>(type: T.Type, instance: T) throws {
        let key = String(describing: type)
        if isRegistered(type: type) {
            throw DependencyError.alreadyRegistered
        }
        queue.sync(flags: .barrier) {
            dependencies[key] = instance as AnyObject
        }
    }
    
    // Register a new singleton instance
    func registerSingleton<T>(type: T.Type, instance: T) throws {
        let key = String(describing: type)
        if isRegistered(type: type) {
            throw DependencyError.alreadyRegistered
        }
        queue.sync(flags: .barrier) {
            singletons[key] = instance as AnyObject
        }
    }
    
    // Resolve a dependency instance
    func resolve<T>(type: T.Type) throws -> T {
        let key = String(describing: type)
        return try queue.sync {
            if let singleton = singletons[key] as? T {
                return singleton
            } else if let dependency = dependencies[key] as? T {
                return dependency
            } else if singletons[key] != nil || dependencies[key] != nil {
                throw DependencyError.typeMismatch
            } else {
                throw DependencyError.notRegistered
            }
        }
    }
    
    // Check if a type is already registered
    func isRegistered<T>(type: T.Type) -> Bool {
        let key = String(describing: type)
        return queue.sync {
            return dependencies[key] != nil || singletons[key] != nil
        }
    }
    
    // Unregister a dependency instance
    func unregister<T>(type: T.Type) throws {
        let key = String(describing: type)
        try queue.sync(flags: .barrier) {
            guard dependencies[key] != nil else {
                throw DependencyError.notRegistered
            }
            dependencies.removeValue(forKey: key)
        }
    }
    
    // Unregister a singleton instance
    func unregisterSingleton<T>(type: T.Type) throws {
        let key = String(describing: type)
        try queue.sync(flags: .barrier) {
            guard singletons[key] != nil else {
                throw DependencyError.notRegistered
            }
            singletons.removeValue(forKey: key)
        }
    }
}

enum DependencyError: Error, LocalizedError {
    case alreadyRegistered
    case notRegistered
    case typeMismatch
    
    var errorDescription: String? {
        switch self {
        case .alreadyRegistered:
            return "An instance of this type is already registered."
        case .notRegistered:
            return "No instance of this type is registered."
        case .typeMismatch:
            return "The resolved instance does not match the expected type."
        }
    }
}

