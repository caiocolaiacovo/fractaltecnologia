//
//  BeerTableViewCell.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 06/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    var id: Int!
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tagline: UILabel!
}
