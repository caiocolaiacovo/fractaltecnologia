//
//  BeerRouterApp.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 06/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import Foundation
import UIKit

class BeerRouterApp: UINavigationController {
    
    // MARK: BeerRouter
    
    func list(window: UIWindow?) {
        let listBeersViewController = ListBeersViewController()
        listBeersViewController.navigationItem.title = "Beer List"
        
        self.viewControllers.append(listBeersViewController)
        window!.rootViewController = self
        
    }
    
    func backToList() {
        //TODO:
    }
}
