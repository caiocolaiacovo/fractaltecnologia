//
//  ListBeersInteractor.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 07/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ListBeersInteractor {
    var outputPresenter: BeersPresenter!
    
    func fetchAllBeers(_ page: Int) {
        Alamofire.request("https://api.punkapi.com/v2/beers?page=\(page)&per_page=80").responseJSON { response in

            
        }
        
        var beers: [BeerItem] = []
        if page == 1 {
            for index in 1...80 {
                var beer = BeerItem()
                beer.id = index
                beer.name = "Beer \(index)"
                beer.tagline = "this is a tagline for beer \(index)"
                beer.beerImage = UIImage(named: "BeerImageDefault")
                
                beers.append(beer)
            }
        }
        if page == 2 {
            for index in 81...160 {
                var beer = BeerItem()
                beer.id = index
                beer.name = "Beer \(index)"
                beer.tagline = "this is a tagline for beer \(index)"
                beer.beerImage = UIImage(named: "BeerImageDefault")
                
                beers.append(beer)
            }
        }
        if page == 3 {
            for index in 161...240 {
                var beer = BeerItem()
                beer.id = index
                beer.name = "Beer \(index)"
                beer.tagline = "this is a tagline for beer \(index)"
                beer.beerImage = UIImage(named: "BeerImageDefault")
                
                beers.append(beer)
            }
        }
        
        outputPresenter.beers = beers
    }
}
