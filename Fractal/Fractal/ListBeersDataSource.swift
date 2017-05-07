//
//  ListBeersDataSource.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 06/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import Foundation
import UIKit

class ListBeersDataSource: NSObject, UITableViewDataSource {
    var beers: [Beer]!
    
    override init() {
        super.init()
        
        setData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("BeerTableViewCell", owner: self, options: nil)?.first as! BeerTableViewCell
        
        cell.name.text = beers[indexPath.row].name
        cell.tagline.text = beers[indexPath.row].tagline
        
        return cell
    }
    
    //Will be replaced when repository is ready.
    private func setData() {
        var beer1 = Beer()
        beer1.name = "Beer 1"
        beer1.tagline = "this is a tagline for beer 1"
        
        var beer2 = Beer()
        beer2.name = "Beer 2"
        beer2.tagline = "this is a tagline for beer 2"
        
        var beer3 = Beer()
        beer3.name = "Beer 3"
        beer3.tagline = "this is a tagline for beer 3"
        
        beers = [beer1, beer2, beer3]
    }
}

struct Beer {
    var name: String?
    var tagline: String?
}
