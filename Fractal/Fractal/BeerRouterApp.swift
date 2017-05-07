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
        navigationBar.barTintColor = UIColor(red:0.29, green:0.56, blue:0.89, alpha:1.0)
        navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        let listBeersViewController = ListBeersViewController()
        listBeersViewController.navigationItem.title = "Beer List"
        self.viewControllers.append(listBeersViewController)
        
        window!.rootViewController = self
    }
    
    func details() {
        let beerDetailViewController = BeerDetailViewController()
        beerDetailViewController.navigationItem.title = "Beer Details"
        let barButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(BeerRouterApp.makeFavorite))
        beerDetailViewController.navigationItem.rightBarButtonItem = barButton
        
        self.pushViewController(beerDetailViewController, animated: true)
    }
    
    func backToList() {
        //TODO:
    }
    
    func makeFavorite() {
        print("favorited")
    }
}
