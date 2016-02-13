//
//  ResultsTableViewController.swift
//  Rokk3rLabs Test
//
//  Created by URpin on 2/12/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class ResultsTableViewController: UITableViewController {

    let model = ResultsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(model.tableDataSource)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return (model.tableDataSource?.count)!
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0) {
            return model.tableDataSource!["Brand"]!.count
        }else if(section == 1) {
            return model.tableDataSource!["Clothing Type"]!.count
        }else {
            return model.tableDataSource!["Result Query"]!.count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return configureCell(indexPath)
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model.sections[section]
    }
    
    
    private func configureCell(indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        var item: String?
        if(indexPath.section == 0) {
            item = model.tableDataSource!["Brand"]![indexPath.row]
        }else if(indexPath.section == 1) {
            item = model.tableDataSource!["Clothing Type"]![indexPath.row]
        }else {
            item = model.tableDataSource!["Result Query"]![indexPath.row]
        }

        cell.textLabel?.text = item
        return cell
    }
}
