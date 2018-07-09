//
//  DetailViewProtocol.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 05.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation

protocol DetailViewProtocol {
    func showRestaurant(restaurant: RestaurantModel)
    func showError(errorString: String)
}
