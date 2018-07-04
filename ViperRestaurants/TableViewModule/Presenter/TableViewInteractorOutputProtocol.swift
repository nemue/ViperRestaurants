//
//  TableViewInteractorOutputProtocol.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 03.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation

protocol TableViewInteractorOutputProtocol {
    func restaurantsLoaded(restaurantsList: [RestaurantModel])
    func restaurantsNotLoaded(error: NetworkingError)
}
