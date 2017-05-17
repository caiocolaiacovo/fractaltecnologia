//
//  ListBeersViewController.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 05/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import UIKit

struct BeerItem {
    var id: Int?
    var name: String?
    var tagline: String?
    var beerImage: UIImage?
}

class ListBeersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewControllerProtocol {

    // MARK: - Attributes
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var presenterInput: BeersPresenter!
    var beers: [BeerItem] = []
    var page = 1
    
    
    // MARK: - View methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenterInput.fetchBeers()
    }
    
    private func setupView() {
        self.navigationItem.title = "Beer List"
        let nibCell = UINib(nibName: "BeerTableViewCell", bundle: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nibCell, forCellReuseIdentifier: "BeerTableViewCell")
        tableView.tableFooterView = UIView()
    }
    
    
    // MARK: - Data source
    
    func dataFetched(_ beers: [BeerItem]) {
        activityIndicator.stopAnimating()

        if beers.count > 0 {
            self.beers.append(contentsOf: beers)
            tableView.reloadData()
        }
    }
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerTableViewCell", for: indexPath) as! BeerTableViewCell
        
        cell.id = beers[indexPath.row].id
        cell.name.text = beers[indexPath.row].name
        cell.tagline.text = beers[indexPath.row].tagline
        cell.beerImage.image = beers[indexPath.row].beerImage
        
        return cell
    }
    
    
    // MARK: - UITableViewDelegate

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let beer = beers[indexPath.row]
//        
//        beerRouter?.details(of: beer.id!)
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0) //#F4F4F4

        print(indexPath.row)
        
        if indexPath.row == beers.count - 1 {
            presenterInput.fetchBeers()
        }
    }
}
