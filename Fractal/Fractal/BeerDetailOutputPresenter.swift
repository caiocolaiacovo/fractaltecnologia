//
//  BeerDetailOutputPresenter.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 06/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import Foundation

class BeerDetailOutputPresenter {
    func list() {
        let beerRouter = BeerRouter()
        beerRouter.backToList()
    }
}
