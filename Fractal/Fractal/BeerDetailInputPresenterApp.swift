//
//  BeerDetailInputPresenter.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 06/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import Foundation

class BeerDetailInputPresenter {
    
    private(set) var beerId: Int?
    
    init(to beerId: Int) {
        self.beerId = beerId
    }
    
    func openFavoriteAction() {
        print("open favorite action for id \(String(describing: beerId))")
    }
}
