//
//  Places.swift
//  Snacktacular
//
//  Created by John Gallaugher on 11/22/17.
//  Copyright © 2017 John Gallaugher. All rights reserved.
//

import Foundation
import CoreLocation

class Places {
    struct PlaceData {
        var placeName: String
        var address: String
        var coordinates: CLLocation
        var postingUserID: String
    }
    
    var placeArray = [PlaceData]()
}
