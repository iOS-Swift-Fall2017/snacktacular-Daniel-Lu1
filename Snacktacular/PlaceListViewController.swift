//
//  PlaceListViewController.swift
//  Snacktacular
//
//  Created by John Gallaugher on 11/22/17.
//  Copyright © 2017 John Gallaugher. All rights reserved.
//

import UIKit
import CoreLocation

class PlaceListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var places = Places()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        places.placeArray.append(Places.PlaceData(placeName: "Shake Shack", address: "The Street - Chestnut Hill", coordinates: CLLocation(), postingUserID: ""))
        places.placeArray.append(Places.PlaceData(placeName: "The Eagle's Nest", address: "Lyons Hall Basement", coordinates: CLLocation(), postingUserID: ""))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let destination = segue.destination as! DetailViewController
            let selectedRow = tableView.indexPathForSelectedRow!.row
            destination.placeData = places.placeArray[selectedRow]
        } else {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedIndexPath, animated: true)
            }
        }
    }
    
    @IBAction func unwindFromLocationDetail(segue: UIStoryboardSegue) {
        let source = segue.source as! DetailViewController
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            places.placeArray[selectedIndexPath.row] = (source.placeData)!
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        } else {
            let newIndexPath = IndexPath(row: places.placeArray.count, section: 0)
            let placeData = source.placeData!
            places.placeArray.append(placeData)
            tableView.insertRows(at: [newIndexPath], with: .bottom)
            tableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
        }
    }
}

extension PlaceListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.placeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = places.placeArray[indexPath.row].placeName
        cell.detailTextLabel?.text = places.placeArray[indexPath.row].address
        return cell
    }
}
