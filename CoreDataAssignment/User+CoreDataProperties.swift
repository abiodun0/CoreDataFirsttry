//
//  User+CoreDataProperties.swift
//  CoreDataAssignment
//
//  Created by Abiodun Shuaib on 27/05/2016.
//  Copyright © 2016 Abiodun Shuaib. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged public var name: String?
    @NSManaged public var numberOfRepos: NSNumber?
    @NSManaged public var photoUrl: String?
    @NSManaged public var username: String?

}
