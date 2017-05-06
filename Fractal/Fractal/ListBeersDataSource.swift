//
//  ListBeersDataSource.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 06/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import Foundation
import UIKit

struct Beer {
    var name: String?
    var tagline: String?
}

class ListBeersDataSource: NSObject, UITableViewDataSource {
    var beers: [Beer]?
    
    override init() {
        super.init()
        
        var beer1 = Beer()
        beer1.name = "Beer 1"
        beer1.tagline = "this is a tagline"
        
        var beer2 = Beer()
        beer2.name = "Beer 1"
        beer2.tagline = "this is a tagline"
        
        var beer3 = Beer()
        beer3.name = "Beer 1"
        beer3.tagline = "this is a tagline"
        
        beers = [beer1, beer2, beer3]
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath) as! BeerTableViewCell
        cell.name.text = beers?[indexPath.row].name
        cell.tagline.text = beers?[indexPath.row].tagline
        
        return cell
    }
}
