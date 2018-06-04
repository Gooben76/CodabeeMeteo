//
//  MeteoController.swift
//  CodabeeMeteo
//
//  Created by Benoît Goossens on 4/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit
import MapKit

class MeteoController: UIViewController {

    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnPlaceLocationManager()
    }

}
