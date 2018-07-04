//
//  TableViewControllerProtocol.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 03.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation

protocol TableViewControllerProtocol {
    func showRestaurants(restaurants: [RestaurantModel])
    func showError(errorString: String)
}
