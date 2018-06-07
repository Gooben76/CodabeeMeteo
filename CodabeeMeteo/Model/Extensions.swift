//
//  Extensions.swift
//  CodabeeMeteo
//
//  Created by Benoît Goossens on 7/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import Foundation

extension Double {
    
    func convertirDoubleToIntToSTring() -> String {
        let valInt = Int(self)
        return String(valInt) + "°C"
    }
}
