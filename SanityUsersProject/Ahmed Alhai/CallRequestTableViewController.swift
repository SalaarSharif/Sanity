//
//  CallRequestTableViewController.swift
//  MobileProgrammingProject
//
//  Created by MobileProg on 6/17/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import UIKit

class CallRequestTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let savedRequests = CallRequest.loadFromFile() {
            requests = savedRequests
        } else {
            requests = CallRequest.loadSampleCallRecords() ?? []
        }
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
    }
    
    
    var requests = [CallRequest]()
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCell", for: indexPath) as! CallRequestTableViewCell
        
        let request = requests[indexPath.row]
        
        cell.update(with: request)
        cell.showsReorderControl = true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedRequest = requests.remove(at: fromIndexPath.row)
        requests.insert(movedRequest, at: to.row)
        tableView.reloadData()
        CallRequest.saveToFile(requests: requests)
    }
    
}

