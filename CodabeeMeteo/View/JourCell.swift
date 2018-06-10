//
//  JourCell.swift
//  CodabeeMeteo
//
//  Created by Benoît Goossens on 10/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

class JourCell: UITableViewCell {

    @IBOutlet weak var jourImageView: UIImageView!
    @IBOutlet weak var jourLabel: UILabel!
    
    var jour: PrevisionJournaliere!
    
    func miseEnPlace(prevision: PrevisionJournaliere) {
        jour = prevision
        ImageDownloader.obtenir.obtenirImageDepuis(jour.icone, imageView: jourImageView)
        let attributed = NSMutableAttributedString(string: jour.jour + "\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 22), .foregroundColor: UIColor.darkGray])
        let descString = NSAttributedString(string: jour.desc + "\n", attributes: [.font: UIFont.italicSystemFont(ofSize: 20), .foregroundColor: UIColor.black])
        let tempString = NSAttributedString(string: "Min: " + jour.min.convertirDoubleToIntToSTring() + "  -  " + "Max: " + jour.max.convertirDoubleToIntToSTring() , attributes: [.font: UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor.black])
        attributed.append(descString)
        attributed.append(tempString)
        jourLabel.attributedText = attributed
    }
}
