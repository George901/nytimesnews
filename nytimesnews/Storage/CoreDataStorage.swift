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
    
    func removeFromFavorites(news: News) {
        if let favorite = news as? Favorite {
            remove(favorite: favorite)
        } else {
            remove(news: news)
        }
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
    
    private func remove(favorite: Favorite) {
        context.delete(favorite)
        saveChanges()
    }

    private func remove(news: News) {
        let fetchRequest: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "newsID == \(news.id)")
        guard let favorite = try? context.fetch(fetchRequest).first else {
            print("No favorites found matching news: \(news.title)")
            return
        }
        remove(favorite: favorite)
    }
}
