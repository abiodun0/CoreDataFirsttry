//: Playground - noun: a place where people can play

import UIKit
import CoreData

let fm = NSFileManager.defaultManager()
if let docsDir = fm.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first {
    let url = docsDir.URLByAppendingPathComponent("MyDocumentName")
    let document = UIManagedDocument(fileURL: url)
    if document.documentState == .Normal {
        print("pleased to have you ")
    }
    if document.documentState == .Closed {
        print("what the fuck")
        if let path = url.path {
            if NSFileManager.defaultManager().fileExistsAtPath(path) {
                print("yay got here")
                let moc = document.managedObjectContext
                let user: NSManagedObject = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: moc)
            }
            else {
                print("did you ever get here")
                document.saveToURL(document.fileURL, forSaveOperation: .ForCreating) {
                
                    print("yay got here!!")
                    print($0)
                }
                let moc = document.managedObjectContext
                if let user = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: moc) as? User {
                    
                }
            }
        }
    }
}

//let urlss = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains:.UserDomainMask)
//let applicatoinDocumentDirectory = urlss[urlss.count-1]
//let modelURL = NSBundle.mainBundle().URLForResource("CoredataExample", withExtension: "momd")!
//let model =  NSManagedObjectModel(contentsOfURL: modelURL)!
//
//
//let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
//let url = applicatoinDocumentDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
//var failureReason = "There was an error creating or loading the application's saved data."
//try! persistentStoreCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
//
//var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
//managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
//
//let entity = NSEntityDescription.insertNewObjectForEntityForName(<#T##entityName: String##String#>, inManagedObjectContext: <#T##NSManagedObjectContext#>)
//let entity2 = NSEntityDescription.entityForName(<#T##entityName: String##String#>, inManagedObjectContext: <#T##NSManagedObjectContext#>)