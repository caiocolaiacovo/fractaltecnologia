//
//  ListBeersViewController.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 05/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import UIKit

class ListBeersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var listBeersDataSource: ListBeersDataSource?
    
    // MARK: View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listBeersDataSource = ListBeersDataSource()
        let nib = UINib(nibName: "BeerTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "BeerTableViewCell")
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.delegate = listBeersDataSource
        tableView.dataSource = listBeersDataSource
        tableView.reloadData()
    }
}
