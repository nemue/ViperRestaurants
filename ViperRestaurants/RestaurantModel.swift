//
//  RestaurantModel.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 03.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation

class RestaurantModel {
    var name: String
    var address: String?
    var rating: Int?
    var image: URL?
    
    init(name: String, address: String? = "", rating: Int? = 0) {
        self.name = name
        self.address = address
        self.rating = rating
    }
}
