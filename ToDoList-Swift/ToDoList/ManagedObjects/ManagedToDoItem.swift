//
//  ManagedToDoItem.swift
//  ToDoList
//
//  Created by Saira on 8/16/16.
//  Copyright © 2016 Saira. All rights reserved.
//

import Foundation
import CoreData


final class ManagedToDoItem: NSManagedObject {

    static let entityName = "ToDoItem"

    @NSManaged var name: String

}
