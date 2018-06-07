//
//  ImageDownloader.swift
//  CodabeeMeteo
//
//  Created by Benoît Goossens on 7/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

class ImageDownloader {
    
    static let obtenir = ImageDownloader()
    
    func obtenirImageDepuis(_ nomImage:String, imageView: UIImageView) {
        let urlBase = "http://openweathermap.org/img/w/"
        let ext = ".png"
        if let url = URL(string: urlBase + nomImage + ext) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                guard data != nil, let image = UIImage(data: data!) else {return}
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }
            task.resume()
        }
    }
}
