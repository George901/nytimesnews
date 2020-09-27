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
    
    func createFavoriteFrom(story: Story) {
        FavoritesFactory.createFavoriteFrom(news: story, in: context)
        saveChanges()
    }
    
    func getFavorites() -> [Favorite] {
        let fetchRequest: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        return (try? context.fetch(fetchRequest)) ?? []
    }
    
    func removeFromFavorites(story: Story) {
        if let favorite = story as? Favorite {
            remove(favorite: favorite)
        } else {
            remove(story: story)
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

    private func remove(story: Story) {
        let fetchRequest: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "newsID == \(story.id)")
        guard let favorite = try? context.fetch(fetchRequest).first else {
            print("No favorites found matching news: \(story.title)")
            return
        }
        remove(favorite: favorite)
    }
}
