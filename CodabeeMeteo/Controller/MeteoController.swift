//
//  MeteoController.swift
//  CodabeeMeteo
//
//  Created by Benoît Goossens on 4/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class MeteoController: UIViewController {

    var locationManager: CLLocationManager?
    var previsions = [Prevision]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnPlaceLocationManager()
    }

    func obtenirURL(latitude:Double, longitude:Double) {
        let urlDeBase = "http://api.openweathermap.org/data/2.5/forecast?"
        let latitude = "lat=" + String(latitude)
        let longitude = "&lon=" + String(longitude)
        let unitEtLang = "&units=metric&lang=fr"
        let cleAPI = "&APPID=" + API
        let urlString = urlDeBase + latitude + longitude + unitEtLang + cleAPI
        guard let url = URL(string: urlString) else {return}
        Alamofire.request(url).responseJSON { (response) in
            if let reponse = response.value as? [String: AnyObject] {
                
            }
        }
    }
}
