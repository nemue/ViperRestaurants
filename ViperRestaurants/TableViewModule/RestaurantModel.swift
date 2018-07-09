//
//  RestaurantModel.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 03.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation
import UIKit

class RestaurantModel {
    var name: String
    var address: String?
    var rating: Int?
    var image: UIImage?
    
    init(name: String, address: String? = "", rating: Int? = 0, image: UIImage? = nil) {
        self.name = name
        self.address = address
        self.rating = rating
        self.image = image
    }
}
