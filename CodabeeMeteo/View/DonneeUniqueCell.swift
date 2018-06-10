//
//  DonneeUniqueCell.swift
//  CodabeeMeteo
//
//  Created by Benoît Goossens on 7/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

class DonneeUniqueCell: UICollectionViewCell {
    
    @IBOutlet weak var iconePrevision: UIImageView!
    @IBOutlet weak var temperaturePrevision: UILabel!
    @IBOutlet weak var descPrevision: UILabel!
    
    var prevision: Prevision!
    
    func miseEnPlace(prevision:Prevision) {
        layer.cornerRadius = 20
        self.prevision = prevision
        ImageDownloader.obtenir.obtenirImageDepuis(prevision.icone, imageView: iconePrevision)
        temperaturePrevision.text = prevision.temperature.convertirDoubleToIntToSTring()
        descPrevision.text = self.prevision.jour + "  " + (DateHelper.obtenir.heure(self.prevision.date) ?? "") + "\n" + self.prevision.desc
    }
}
