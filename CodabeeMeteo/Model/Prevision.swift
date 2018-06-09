//
//  Prevision.swift
//  CodabeeMeteo
//
//  Created by Benoît Goossens on 6/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

class Prevision {
    
    private var _temperature: Double
    private var _date: String
    private var _icone: String
    private var _desc: String
    private var _jour: String
    
    var temperature: Double {
        return _temperature
    }
    var date: String {
        return _date
    }
    var icone: String {
        return _icone
    }
    var desc: String {
        return _desc
    }
    var jour: String {
        return _jour
    }
    
    init(temperature: Double, date: String, icone: String, desc: String) {
        _temperature = temperature
        _date = date
        _icone = icone
        _desc = desc
        _jour = DateHelper.obtenir.jourDeLaSemaine(date) ?? ""
    }
}
