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

    let listBeers = ListBeersDataSource()
    
    // MARK: View
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.dataSource = listBeers
        tableView.reloadData()
    }
}
