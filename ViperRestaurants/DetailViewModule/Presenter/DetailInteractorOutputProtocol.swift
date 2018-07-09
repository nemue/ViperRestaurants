//
//  DetailInteractorOutputProtocol.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 05.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation

protocol DetailInteractorOutputProtocol {
    func restaurantLoaded(restaurant: RestaurantModel)
    func restaurantNotLoaded(error: NetworkingError)
}
