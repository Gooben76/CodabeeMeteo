//
//  TableViewExtension.swift
//  CodabeeMeteo
//
//  Created by Benoît Goossens on 7/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

extension MeteoController: UITableViewDelegate, UITableViewDataSource {
    
    func miseEnPlace() {
        previsionTableView.delegate = self
        previsionTableView.dataSource  = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return previsionsJournalieres.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = previsionTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? PrevisionCell {
                cell.miseEnPlace(previsions: previsions)
                return cell
            }
        } else {
            let prevision = previsionsJournalieres[indexPath.row - 1]
            if let cell = previsionTableView.dequeueReusableCell(withIdentifier: "JourCell", for: indexPath) as? JourCell {
                cell.miseEnPlace(prevision: prevision)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 180
        }
        return 100
    }
}
