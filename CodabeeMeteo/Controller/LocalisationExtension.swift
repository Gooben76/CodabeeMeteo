//
//  LocalisationExtension.swift
//  CodabeeMeteo
//
//  Created by Benoît Goossens on 4/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit
import MapKit

extension MeteoController: CLLocationManagerDelegate {
    
    func miseEnPlaceLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard locations.count > 0 else { return }
        locationManager?.stopUpdatingLocation()
        let positionActuelle = locations[0]
        let latitude = positionActuelle.coordinate.latitude
        let longitude = positionActuelle.coordinate.longitude
        if !enTrainObtenirLesDonnees {
            previsionsJournalieres = [PrevisionJournaliere]()
            previsions = [Prevision]()
            obtenirURL(latitude: latitude, longitude: longitude)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
