//
//  BeersPresenter.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 09/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import Foundation

protocol BeersPresenterProtocol {
    //func listAll(_ beers: [BeerItem])
}

class BeersPresenter: BeersPresenterProtocol {
    
    var interactor: ListBeersInteractor!
    var viewController: ViewControllerProtocol!
    var router: BeersRouter!
    var beers: [BeerItem] = []
    
    func fetchAllBeers() {
        interactor.fetchAllBeers()
        viewController.allBeersData(beers)
    }

    
}
