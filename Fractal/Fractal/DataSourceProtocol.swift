//
//  DataSourceProtocol.swift
//  Fractal
//
//  Created by Caio Colaiacovo on 07/05/17.
//  Copyright © 2017 Caio Colaiacovo. All rights reserved.
//

import Foundation

@objc protocol DataSourceProtocol {
    func listAll(_ items: [Any])
    @objc optional func listItem(by id: Int)
}
