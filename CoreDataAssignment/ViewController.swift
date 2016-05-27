//
//  ViewController.swift
//  CoreDataAssignment
//
//  Created by Abiodun Shuaib on 18/05/2016.
//  Copyright © 2016 Abiodun Shuaib. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    var document: UIManagedDocument!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fm = NSFileManager.defaultManager()
        if let docsDir = fm.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first {
            let url = docsDir.URLByAppendingPathComponent("MyDocumentName")
            document = UIManagedDocument(fileURL: url)
            if document.documentState == .Normal {
                print("pleased to have you ")
                setUserDetails()
            }
            if document.documentState == .Closed {
                print("what the fuck")
                if let path = url.path {
                    if NSFileManager.defaultManager().fileExistsAtPath(path) {
                        print("yay got here")
                        setUserDetails()
                    }
                    else {
                        print("did you ever get here")
                        document.saveToURL(document.fileURL, forSaveOperation: .ForCreating) {
                            
                            print("yay got here!!")
                            print($0)
                        }
                        setUserDetails()
                    }
                }
            }
        }
    }
    private func setUserDetails(){
    let moc = document.managedObjectContext
        if let user = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: moc) as? User {
            user.name = "Abiodun Shuaib"
            user.numberOfRepos = 50
            user.photoUrl = "http://github.com/abiodun0"
            user.username = "abiodun0"

        }
    }
    @IBAction func printInfo(sender: UIButton) {
        let request = NSFetchRequest(entityName: "User")
        request.fetchLimit = 100
        request.fetchBatchSize = 2
        request.sortDescriptors = []
        request.predicate = NSPredicate(format: "name contains[c] %@", "abiodun")
        let context = document.managedObjectContext // or AppDelegate var
        let users = try? context.executeFetchRequest(request)
        print(users)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

