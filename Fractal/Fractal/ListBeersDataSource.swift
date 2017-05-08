//
//  ListBeersDataSource.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 06/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import Foundation
import UIKit

class ListBeersDataSource: NSObject, UITableViewDataSource, UITableViewDelegate, DataSourceProtocol {
    var beers: [BeerItem]!
    var beerRouter: BeerRouter?
    
    override init() {
        super.init()
        beerRouter = BeerRouter.sharedInstance
        
        ListBeersInteractor(to: self).listAll()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerTableViewCell", for: indexPath) as! BeerTableViewCell
        
        cell.id = beers[indexPath.row].id
        cell.name.text = beers[indexPath.row].name
        cell.tagline.text = beers[indexPath.row].tagline
        cell.beerImage.image = beers[indexPath.row].beerImage
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beer = beers[indexPath.row]
        
        beerRouter?.details(of: beer.id!)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0) //#F4F4F4
    }
    
    func listAll(_ items: [Any]) {
        beers = items as! [BeerItem]
    }
}

struct BeerItem {
    var id: Int?
    var name: String?
    var tagline: String?
    var beerImage: UIImage?
}
