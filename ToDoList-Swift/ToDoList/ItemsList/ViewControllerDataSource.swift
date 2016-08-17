//
//  ViewControllerDataSource.swift
//  ToDoList
//
//  Created by Saira on 8/11/16.
//  Copyright © 2016 Saira. All rights reserved.
//

import Foundation
import UIKit
import CoreData

/// Data Source for To-Do Items List
final class ViewControllerDataSource: NSObject {
    /// Tableview to display To-do items
    weak var tableView: UITableView?
    /// Activity Log that will be displayed in the table view
    var toDoItems = [ManagedToDoItem]()

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()

        self.tableView?.dataSource = self
        fetchItems()
    }

    /**
     Fetches To-Do list saved in Cored data and shows them in list
     */
    func fetchItems() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext

        let entityDescription =
            NSEntityDescription.entityForName("ToDoItem",
                                              inManagedObjectContext:
                                                    managedContext)

        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = entityDescription

        do {
            let results =
                try managedContext.executeFetchRequest(fetchRequest)

                if let managedResults = results as? [ManagedToDoItem] {
                    toDoItems += managedResults
                }

            self.tableView?.reloadData()
        } catch let error as NSError {
            assertionFailure(error.localizedDescription)
        }
    }

    /**
     Inserts new item and reloads the table view after insertion

     - parameter item: Name of newly inserted To-Do Item
     */
    func insertItem(name: String) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext

            let entityDescription =
                NSEntityDescription.entityForName("ToDoItem",
                                                  inManagedObjectContext: managedContext)

            let managedItem = ManagedToDoItem(entity: entityDescription!,
                                              insertIntoManagedObjectContext: managedContext)
            managedItem.name = name
            do {
                try managedContext.save()
                self.toDoItems.append(managedItem)
            } catch let error as NSError {
                print("Could not save \(error), \(error.userInfo)")
            }

            dispatch_async(dispatch_get_main_queue()) {
                self.tableView?.reloadData()
            }
        }
    }
}


extension ViewControllerDataSource: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let item: ManagedToDoItem = self.toDoItems[indexPath.row] else {
            fatalError("No Item at indexPath, check data source.")
        }

        guard let cell = tableView.dequeueReusableCellWithIdentifier("to_do_cell") as? ToDoItemCell else {
            fatalError("No cell with this identifier")
        }

        cell.configure(withItem: item)

        return cell
    }
}
