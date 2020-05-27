
import Foundation
import CoreData

class CoreDataStore {
    
    // MARK: - Object lifecycle
    
    init() {}
    
    // MARK: - Managed object contexts
    
    static private var _mainManagedObjectContext: NSManagedObjectContext?
    static var mainManagedObjectContext: NSManagedObjectContext {
        get {
            return persistentContainer.viewContext
        } set {
            _mainManagedObjectContext = newValue
        }
    }
    
    static private var _persistentContainer: NSPersistentContainer?
    static var persistentContainer: NSPersistentContainer {
        get {
            if _persistentContainer == nil {
                _persistentContainer = NSPersistentContainer(name: "Zelty")
                _persistentContainer?.loadPersistentStores(completionHandler: { (storeDescription, error) in
                    
                    if let error = error as NSError? {
                        fatalError("Unresolved error \(error), \(error.userInfo)")
                    }
                })
            }
            return _persistentContainer!
        } set {
            _persistentContainer = newValue
        }
    }
    
    deinit
    {
        do {
            try CoreDataStore.mainManagedObjectContext.save()
        } catch {
            fatalError("Error deinitializing main managed object context")
        }
    }
}
