//
//  DetailViewController.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 05.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, DetailViewProtocol {
    
    // MARK: - Properties
    
    var presenter: DetailPresenterProtocol?
    
    // MARK: - Outlets
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantAdressLabel: UILabel!
    @IBOutlet weak var restaurantAddress: UILabel!
    @IBOutlet weak var restaurantRatingLabel: UILabel!
    @IBOutlet weak var restaurantRating: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    
    
    
    // MARK: - Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateRestaurantView()
        self.configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    // MARK: - DetailViewProtocol
    
    func showRestaurant(restaurant: RestaurantModel) {
        self.restaurantNameLabel.text = restaurant.name
        self.restaurantAddress.text = restaurant.address ?? ""
        self.restaurantRating.text = String(describing: restaurant.rating ?? 0)
        self.restaurantImage.image = restaurant.image ?? nil
    }
    
    func showError(errorString: String) {
        let alert = UIAlertController(title: "Error", message: errorString, preferredStyle:
            .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
}

// MARK: - Configuration

extension DetailViewController {
    
    func configure() {
        self.restaurantAdressLabel.text = "Adresse"
        self.restaurantRatingLabel.text = "Rating"
    }
}
