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
    var imageUrl: String?
}

class ListBeersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewControllerProtocol {

    // MARK: - Attributes
    
    @IBOutlet weak var tableView: UITableView!
    var presenterInput: BeersPresenter!
    var beers: [BeerItem] = []
    
    
    // MARK: - ViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenterInput.fetchBeers()
    }
    
    
    // MARK: - View setup
    
    private func setupView() {
        self.navigationItem.title = "Beer List"
        let cell = UINib(nibName: "BeerTableViewCell", bundle: nil)
        let footerView = setupTableViewFooterView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell, forCellReuseIdentifier: "BeerTableViewCell")
        tableView.tableFooterView = footerView
        tableView.tableFooterView?.isHidden = false
    }
    
    private func setupTableViewFooterView() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 74))
        let fetchDataActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        
        fetchDataActivityIndicator.isHidden = false
        fetchDataActivityIndicator.startAnimating()
        fetchDataActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        footerView.addSubview(fetchDataActivityIndicator)
        
        NSLayoutConstraint(item: fetchDataActivityIndicator, attribute: .centerX, relatedBy: .equal, toItem: footerView, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: fetchDataActivityIndicator, attribute: .centerY, relatedBy: .equal, toItem: footerView, attribute: .centerY, multiplier: 1.0, constant: 0.0).isActive = true
        
        return footerView
    }
    
    
    // MARK: - Data source
    
    func dataFetched(_ beers: [BeerItem]) {
        if beers.count > 0 {
            self.beers.append(contentsOf: beers)
            
            tableView.tableFooterView?.isHidden = true
            tableView.reloadData()
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.tableView.tableFooterView = UIView()
            })
        }
    }
    
    func imageFetched(with data: Data, to cell: AnyObject) {
        if let cell = cell as? BeerTableViewCell {
            DispatchQueue.main.async {
                cell.beerImage.image = UIImage(data: data)
            }
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
        cell.beerImage.image = UIImage(named: "BeerImageDefault")
        
        presenterInput.fetchImage(from: beers[indexPath.row].imageUrl!, to: cell)
        
        return cell
    }
    
    
    // MARK: - UITableViewDelegate

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let beer = beers[indexPath.row]
//        beerRouter?.details(of: beer.id!)
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0) //#F4F4F4

        if indexPath.row == beers.count - 1 {
            tableView.tableFooterView?.isHidden = false
            presenterInput.fetchBeers()
        }
    }
}
