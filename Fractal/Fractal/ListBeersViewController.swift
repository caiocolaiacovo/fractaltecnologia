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
    
    // MARK: View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = ListBeersDataSource()
    }
}
