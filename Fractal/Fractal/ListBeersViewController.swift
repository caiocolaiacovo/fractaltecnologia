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

    let listBeersDataSource = ListBeersDataSource()
    
    // MARK: View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.delegate = listBeersDataSource
        tableView.dataSource = listBeersDataSource
        tableView.reloadData()
    }
    
    private func setupView() {
        self.navigationItem.title = "Beer List"
        let nib = UINib(nibName: "BeerTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "BeerTableViewCell")
        tableView.tableFooterView = UIView()
    }
}
