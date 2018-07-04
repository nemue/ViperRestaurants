//
//  TableViewCell.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 04.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    // MARK: - Configuration
    
    func configureCell(restaurant: RestaurantModel) {
        self.nameLabel.text = restaurant.name
        let rating = restaurant.rating ?? 0
        self.ratingLabel.text = String(describing: rating)
    }
}
