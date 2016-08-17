//
//  ViewController.swift
//  ToDoList
//
//  Created by Saira on 8/11/16.
//  Copyright © 2016 Saira. All rights reserved.
//

import UIKit

/// Screen for displaying To-do Items
class ViewController: UIViewController {
    /// TableView for displaying To-do items
    @IBOutlet weak var toDoList: UITableView!
    /// The data source object for the table view
    var dataSourceController: ViewControllerDataSource?
    /// Delegate object for handling touches on to do list
    var toDoItemsDelegate: ViewControllerDelegate?
    /// Textfield on alert view
    weak var nameTextField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "To-Do Items"
        dataSourceController = ViewControllerDataSource(tableView: toDoList)
        toDoItemsDelegate = ViewControllerDelegate(tableView: toDoList)
    }


    @IBAction func addNewItem(sender: AnyObject) {
       self.alertWithMessage("Add New Item", message: nil)
    }

    /**
     Calls datasource on clicking add button of Alert
     */
    func saveNewItem() {
        guard let textField = self.nameTextField,
            let dataSourceController = self.dataSourceController,
            let name = textField.text where !name.isEmpty else {
                return
        }

        dataSourceController.insertItem(name)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension ViewController {
    func alertWithMessage(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)

        alertController.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
            textField.placeholder = "Enter Item"
            self.nameTextField = textField
        }

        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))

        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default) {
            UIAlertAction in self.saveNewItem()
        }

        alertController.addAction(addAction)

        alertController.view.setNeedsLayout()
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
