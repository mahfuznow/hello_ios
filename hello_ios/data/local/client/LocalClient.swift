//
//  LocalDataService.swift
//  hello_ios
//
//  Created by BS1002 on 12/6/24.
//

import Foundation
import SwiftData

class LocalClient<T> where T: SwiftData.PersistentModel{
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    init() {
        self.modelContainer = try! ModelContainer(for: T.self)
        self.modelContext = modelContainer.mainContext
    }
    
    func appendItem(item: T) {
        modelContext.insert(item)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchItems() -> [T] {
        do {
            return try modelContext.fetch(FetchDescriptor<T>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func removeItem(_ item: T) {
        modelContext.delete(item)
    }
}
