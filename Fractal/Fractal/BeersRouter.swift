//
//  BeersRouter.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 06/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import Foundation
import UIKit

class BeersRouter {
    
    // MARK: - Root Screen (initializing module).
    
    static func presentRootScreen() -> UIViewController {
        let navigationController = UINavigationController()
        
        navigationController.navigationBar.barTintColor = UIColor(red:0.29, green:0.56, blue:0.89, alpha:1.0) //#4A90E2
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        let listBeersViewController = ListBeersViewController()
        let presenter = BeersPresenter()
        let router = BeersRouter()
        let interactor = ListBeersInteractor()
        
        navigationController.viewControllers.append(listBeersViewController)
        
        listBeersViewController.presenterInput = presenter
        presenter.viewController = listBeersViewController as ViewControllerProtocol
        presenter.router = router
        presenter.interactor = interactor
        interactor.outputPresenter = presenter
        
        return navigationController
    }
    
//    func details(of beerId: Int) {
//        let barButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(BeerRouter.makeFavorite))
//        let beerDetailViewController = BeerDetailViewController()
//        
//        beerDetailViewController.navigationItem.title = "Beer Details"
//        beerDetailViewController.navigationItem.rightBarButtonItem = barButton
//        self.pushViewController(beerDetailViewController, animated: true)
//    }
//
//    func backToList() {
//        //TODO:
//    }
//    
//    func makeFavorite() {
//        print("favorited")
//    }
//    
//    // MARK: - Support methods
//    
//    private func setupNavigationBar() {
//        
//    }
}
