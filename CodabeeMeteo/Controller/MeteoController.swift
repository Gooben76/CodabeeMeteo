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

    @IBOutlet weak var villeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var iconeImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var previsionTableView: UITableView!
    
    var locationManager: CLLocationManager?
    var previsions = [Prevision]()
    
    let cellID = "PrevisionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnPlaceLocationManager()
        miseEnPlace()
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
                if let donneesVille = reponse["city"] as? [String: AnyObject] {
                    if let maVille = donneesVille["name"] as? String {
                        self.villeLabel.text = maVille
                        if let liste = reponse["list"] as? NSArray {
                            for elem in liste {
                                if let dict = elem as? [String: AnyObject] {
                                    if let mainData = dict["main"] as? [String: AnyObject] {
                                        if let temperature = mainData["temp"] as? Double {
                                            if let weatherData = dict["weather"] as? NSArray, weatherData.count > 0 {
                                                if let weather = weatherData[0] as? [String: AnyObject] {
                                                    if let desc = weather["description"] as? String {
                                                        if let icon = weather["icon"] as? String {
                                                            if let date = dict["dt_txt"] as? String {
                                                                let nouvellePrevision = Prevision(temperature: temperature, date: date, icone: icon, desc: desc)
                                                                self.previsions.append(nouvellePrevision)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            self.miseAJourDonneeDuMoment()
                            self.previsionTableView.reloadData()
                        }
                    }
                }
            }
        }
    }
    
    func miseAJourDonneeDuMoment() {
        if previsions.count > 0 {
            temperatureLabel.text = previsions[0].temperature.convertirDoubleToIntToSTring()
            descriptionLabel.text = previsions[0].desc
            ImageDownloader.obtenir.obtenirImageDepuis(previsions[0].icone, imageView: iconeImageView)
        }
    }
}
