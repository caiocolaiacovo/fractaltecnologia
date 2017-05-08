//
//  BeerRouter.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 06/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import Foundation
import UIKit

class BeerRouter: UINavigationController {
    
    // MARK: - Singleton
    
    static let sharedInstance: BeerRouter = {
        let instance = BeerRouter()
        return instance
    }()
    
    // MARK: - BeerRouter
    
    func list(window: UIWindow?) {
        setupNavigationBarStyle()
        
        let listBeersViewController = ListBeersViewController()
        
        listBeersViewController.navigationItem.title = "Beer List"
        self.viewControllers.append(listBeersViewController)
        window?.rootViewController = self
    }
    
    func details(of beerId: Int) {
        let barButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(BeerRouter.makeFavorite))
        let beerDetailViewController = BeerDetailViewController()
        
        beerDetailViewController.navigationItem.title = "Beer Details"
        beerDetailViewController.navigationItem.rightBarButtonItem = barButton
        self.pushViewController(beerDetailViewController, animated: true)
    }
    
    func backToList() {
        //TODO:
    }
    
    func makeFavorite() {
        print("favorited")
    }
    
    private func setupNavigationBarStyle() {
        navigationBar.barTintColor = UIColor(red:0.29, green:0.56, blue:0.89, alpha:1.0) //#4A90E2
        navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
}
