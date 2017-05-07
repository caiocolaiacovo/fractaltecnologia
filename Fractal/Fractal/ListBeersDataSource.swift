//
//  ListBeersDataSource.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 06/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import Foundation
import UIKit

class ListBeersDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    var beers: [BeerItem]!
    
    override init() {
        super.init()
        
        setData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerTableViewCell", for: indexPath) as! BeerTableViewCell
        
        cell.name.text = beers[indexPath.row].name
        cell.tagline.text = beers[indexPath.row].tagline
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt")
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0) //#F4F4F4
    }
    
    //Will be replaced when repository is ready.
    private func setData() {
        var beer1 = BeerItem()
        beer1.name = "Beer 1"
        beer1.tagline = "this is a tagline for beer 1"
        
        var beer2 = BeerItem()
        beer2.name = "Beer 2"
        beer2.tagline = "this is a tagline for beer 2"
        
        var beer3 = BeerItem()
        beer3.name = "Beer 3"
        beer3.tagline = "this is a tagline for beer 3"
        
        beers = [beer1, beer2, beer3]
    }
}

struct BeerItem {
    var name: String?
    var tagline: String?
}
