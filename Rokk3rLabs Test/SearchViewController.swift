//
//  ViewController.swift
//  Rokk3rLabs Test
//
//  Created by URpin on 2/12/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit
import KVNProgress

class SearchViewController: UIViewController {

    
    @IBOutlet weak var searchTextField: UITextField!
    let model = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var string = "boss denim red pants hugo boss"
        let range = string.capitalizedString.rangeOfString("Hugo Boss")
        if(range != nil) {
            print(string.capitalizedString.stringByReplacingOccurrencesOfString("Hugo Boss", withString: ""))
        }
        
        model.searchParts(searchTerm: "boss denim red pants hugo boss".capitalizedString)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchAction(sender: AnyObject) {
        let searchTerm = searchTextField.text?.capitalizedString
        if(Validator.sharedInstance.stringIsEmpty(searchTerm!)) {
            KVNProgress.showErrorWithStatus("Please enter a search term")
        }else {
            let results = model.searchParts(searchTerm: searchTerm!)
            self.performSegueWithIdentifier("showResults", sender: results)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showResults") {
            let resultsVC = segue.destinationViewController as! ResultsTableViewController
            let dataSource = sender as! Dictionary<String, Array<String>>
            resultsVC.model.tableDataSource = dataSource
        }
    }
}

