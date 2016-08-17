//
//  ViewControllerDelegate.swift
//  ToDoList
//
//  Created by Saira on 8/11/16.
//  Copyright © 2016 Saira. All rights reserved.
//

import Foundation
import UIKit

final class ViewControllerDelegate: NSObject {
    // table view of to do items
    weak var tableView: UITableView?

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        configureTableView()
    }

    /**
     Configures table view's row height and header here
     */
    func configureTableView() {
        self.tableView?.estimatedRowHeight = ToDoItemCell.prefferedHeight
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        self.configureTableHeader()
        tableView?.delegate = self
    }
}

// MARK: - UITableViewDelegate conformance
extension ViewControllerDelegate: UITableViewDelegate {

    /**
     Configuring table header is necessary else it will show empty space above
     table view
     */
    func configureTableHeader() {
        let tableHeader = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
        tableHeader.backgroundColor = UIColor.clearColor()
        self.tableView?.tableHeaderView = tableHeader
    }
}
