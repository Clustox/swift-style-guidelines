//
//  ToDoItemCell.swift
//  ToDoList
//
//  Created by Saira on 8/11/16.
//  Copyright © 2016 Saira. All rights reserved.
//

import Foundation
import UIKit

class ToDoItemCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
}

extension ToDoItemCell {
    /**
     Configures cell with To do item's info

     - parameter item: Todo Item
     */
    func configure(withItem item: ManagedToDoItem) {
        nameLabel.text = item.name
    }

    /// returns preferred height for table view row
    static var prefferedHeight: CGFloat {
        return 30.0
    }
}
