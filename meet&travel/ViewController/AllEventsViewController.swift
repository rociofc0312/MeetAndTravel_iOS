//
//  AllEventsViewController.swift
//  meet&travel
//
//  Created by Developer User on 11/20/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import os

private let reuseIdentifier = "Cell"

class AllEventsViewController: UITableViewController {
    
    var events: [Event] = [Event]()
    var currentRow = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        MeetAndTravelApi.getEvents(responseHandler: handleResponse, errorHandler: handleError)
    }
    
    func handleResponse(response: NetworkResponse) {
        if let events = response.events {
            self.events = events
            self.tableView.reloadData()
        }
    }
    
    func handleError(error: Error) {
        let message = "Error on Sources Request: \(error.localizedDescription)"
        print(error)
        os_log("%@", message)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return events.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! AllEventCell

        // Configure the cell...
        cell.update(from: events[indexPath.row])
        return cell
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEvent" {
            let destination = segue.destination as! EventViewController
            destination.event = events[currentRow]
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentRow = indexPath.row
        performSegue(withIdentifier: "showEvent", sender: self)
    }

}
