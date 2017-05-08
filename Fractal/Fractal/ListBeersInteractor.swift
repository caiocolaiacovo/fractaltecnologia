//
//  ListBeersInteractor.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 07/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import Foundation
import UIKit

class ListBeersInteractor {
    var dataSource: DataSourceProtocol?
    
    init(to dataSource: DataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func listAll() {
        //Will be replaced when repository is done
        var beer1 = BeerItem()
        beer1.id = 1
        beer1.name = "Beer 1"
        beer1.tagline = "this is a tagline for beer 1"
        beer1.beerImage = UIImage(named: "BeerImageDefault")
        
        var beer2 = BeerItem()
        beer2.id = 2
        beer2.name = "Beer 2"
        beer2.tagline = "this is a tagline for beer 2"
        beer2.beerImage = UIImage(named: "BeerImageDefault")
        
        var beer3 = BeerItem()
        beer3.id = 3
        beer3.name = "Beer 3"
        beer3.tagline = "this is a tagline for beer 3"
        beer3.beerImage = UIImage(named: "BeerImageDefault")
        
        let beers = [beer1, beer2, beer3]
        
        dataSource?.listAll(beers)
    }
}
