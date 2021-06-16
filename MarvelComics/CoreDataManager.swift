//
//  CoreDataManager.swift
//  MarvelComics
//
//  Created by Alisher on 6/15/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "LocalDBModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private init() {}
    
    
    func save() {
        let context = persistentContainer.viewContext
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func backgroundSave(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func addComics(_ comics: ComicsDetailEntity.ComicsData.Comics, email: String) {
        let context = persistentContainer.viewContext
        let backgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        backgroundContext.parent = context
        backgroundContext.perform {
            let newComics = FavComicsEntity(context: backgroundContext)
            newComics.id = Int64(comics.id)
            newComics.name = comics.title
            newComics.format = comics.format
            newComics.desc = comics.description
            newComics.userEmail = email
            newComics.thumbnail = "\(comics.thumbnail?.path ?? "")"
            
            self.backgroundSave(context: backgroundContext)
            self.save()
        }
    }
    
    func findComics(with id: Int, email: String) -> FavComicsEntity? {
        let context = persistentContainer.viewContext
        let requestResult: NSFetchRequest<FavComicsEntity> = FavComicsEntity.fetchRequest()
        
        let idPredicate = NSPredicate(format: "id == %d", id)
        let emailPredicate = NSPredicate(format: "userEmail == %@", email)
        let andPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [idPredicate, emailPredicate])
        
        requestResult.predicate = andPredicate
        
        do {
            let comics = try context.fetch(requestResult)
            if comics.count > 0 {
                assert(comics.count == 1, "It means DB has duplicates")
                return comics[0]
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    
    func deleteComics(with id: Int, email: String) {
        let context = persistentContainer.viewContext
        let comics = findComics(with: id, email: email)
        if let comics = comics {
            context.delete(comics)
            save()
        }
    }
    
    
    func allComics(email: String) -> [ComicsEntity.ComicsData.Comics] {
        let context = persistentContainer.viewContext
        let requestResult: NSFetchRequest<FavComicsEntity> = FavComicsEntity.fetchRequest()
        requestResult.predicate = NSPredicate(format: "userEmail == %@", email)

        let comics = try? context.fetch(requestResult)
        
        return comics?.map({ ComicsEntity.ComicsData.Comics(comics: $0) }) ?? []
    }
    
//    func deleteAll(_ entity: String) {
//        let context = persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
//        fetchRequest.returnsObjectsAsFaults = false
//        do {
//            let results = try context.fetch(fetchRequest)
//            for game in results {
//                guard let game = game as? NSManagedObject else {continue}
//                context.delete(game)
//            }
//        } catch let error {
//            print("Detele all data in \(entity) error :", error)
//        }
//    }
}
