//
//  DataSourceProtocol.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 07/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import Foundation
import UIKit

@objc protocol DataSourceProtocol {
    func listAll(_ items: [Any])
    @objc optional func listItem(by id: Int)
}

protocol Routing {
    //func presentRootScreen() -> UIView
}

protocol ViewControllerProtocol {
    func dataFetched(_ beers: [BeerItem])
    func imageFetched(with data: Data, to cell: AnyObject)
}
