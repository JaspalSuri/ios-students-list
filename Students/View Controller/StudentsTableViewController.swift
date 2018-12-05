//
//  StudentsTableViewController.swift
//  Students
//
//  Created by Jaspal on 12/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController {


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        
        cell.textLabel?.text = students[indexPath.row].name
        
        return cell
    }
 
    // MARK: - Properties
    
    var students: [Student] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
    
        }
    }
}
