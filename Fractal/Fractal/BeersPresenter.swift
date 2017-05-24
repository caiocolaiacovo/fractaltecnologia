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
    var page = 0
    
    func fetchBeers() {
        page += 1
        
        interactor.fetchAllBeers(page)
    }
    
    func beersFetched(_ beers: [BeerItem]) {
        viewController.dataFetched(beers)
    }

    func fetchImage(from url: String?, to cell: AnyObject) {
        if let _ = url {
            interactor.fetchImage(from: url!, to: cell)
        }
    }
    
    func imageFetched(_ data: Data, to cell: AnyObject) {
        viewController.imageFetched(with: data, to: cell)
    }
}
