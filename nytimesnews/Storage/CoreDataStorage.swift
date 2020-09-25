//
//  CoreDataStorage.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 25.09.2020.
//

import UIKit
import CoreData

class CoreDataStorage: NSObject, Storage {
    
    private var container: NSPersistentContainer!
    private var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    func configure() {
        container = NSPersistentContainer(name: "News")
        container.loadPersistentStores { (storeDescr, error) in
            if let err = error {
                print(err)
            }
        }
    }
    
    func createFavoriteFrom(news: News) {
        FavoritesFactory.createFavoriteFrom(news: news, in: context)
        saveChanges()
    }
    
    func getFavorites() -> [Favorite] {
        let fetchRequest: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        return (try? context.fetch(fetchRequest)) ?? []
    }
    
    func delete(favorite: Favorite) {
        context.delete(favorite)
        saveChanges()
    }
    
    func clear() {
        let batchRequest = NSBatchDeleteRequest(fetchRequest: Favorite.fetchRequest())
        let result = try? context.execute(batchRequest)
        print(result)
        saveChanges()
    }
    
    private func saveChanges() {
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                print(error)
            }
        }
    }

}
