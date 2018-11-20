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
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
