//
//  BeerDetailViewController.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 05/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {

    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tagline: UILabel!
    @IBOutlet weak var beerDescription: UILabel!
    
    func makeFavorite() {
        let beerDetailInputPresenterApp = BeerDetailInputPresenterApp()
        
        beerDetailInputPresenterApp.makeBeerFavorite()
    }
}
