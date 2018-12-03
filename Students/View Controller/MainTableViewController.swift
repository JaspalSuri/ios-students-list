//
//  MainTableViewController.swift
//  Students
//
//  Created by Jaspal on 12/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Segmented Control
    
    @IBAction func sort(_ sender: Any) {
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedStudentsTableView" {
            let studentsTableVC = segue.destination as! StudentsTableViewController
            StudentsTableViewController = studentsTableVC
        }
    }
    
    @IBOutlet weak var sortSelector: UISegmentedControl!

    private var studentsTableViewController: StudentsTableViewController!
}