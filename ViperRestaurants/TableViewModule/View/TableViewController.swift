//
//  TableViewController.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 03.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: TableViewPresenterProtocol?
    private var restaurantList: [RestaurantModel]?
    
    //MARK: - Outlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateRestaurantList()
    }
}

// MARK: - TableView Controller Protocol

extension TableViewController: TableViewControllerProtocol {
    func showError(errorString: String) {
        let alert = UIAlertController(title: "Error", message: errorString, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func showRestaurants(restaurants: [RestaurantModel]) {
        self.restaurantList = restaurants
    }
}

// MARK: - TableView Delegate

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.restaurantSelected(position: indexPath.row)
    }
}

// MARK: - TableView DataSource

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurantList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as? TableViewCell
            else{
                fatalError("The dequeued cell is not an instance of EventTableViewCell")
        }
        
        let restaurant = self.restaurantList![indexPath.row]
        cell.configureCell(restaurant: restaurant)
        return cell
    }
    
    
}
