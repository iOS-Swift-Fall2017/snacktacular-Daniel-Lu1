//
//  DetailViewController.swift
//  Snacktacular
//
//  Created by John Gallaugher on 11/22/17.
//  Copyright © 2017 John Gallaugher. All rights reserved.
//

import UIKit
import CoreLocation

class DetailViewController: UIViewController {
    
    @IBOutlet weak var placeNameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    
    var placeData: PlaceData?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let placeData = placeData {
            placeNameLabel.text = placeData.placeName
            addressLabel.text = placeData.address
        } else {
            placeData = PlaceData(placeName: "", address: "", postingUserID: "", coordinate: CLLocationCoordinate2D())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        placeData?.placeName = placeNameLabel.text!
        placeData?.address = addressLabel.text!
    }

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
}
