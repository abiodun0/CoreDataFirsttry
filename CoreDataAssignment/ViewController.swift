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
    var document: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        document = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        setUserDetails()

    }
    private func setUserDetails(){
        if let user = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: document) as? User {
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
        request.predicate = NSPredicate(format: "username contains[c] %@", "abiodun")
        let users = try? document.executeFetchRequest(request)
        print(users)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

