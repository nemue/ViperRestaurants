//
//  TableViewPresenter.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 03.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation

class TableViewPresenter: TableViewPresenterProtocol {
    
    // MARK: - Properties
    
    var interactor: TableViewInteractorInputProtocol?
    var view: TableViewControllerProtocol?
    
    // MARK: - Update Restaurant List
    
    func updateRestaurantList() {
        interactor?.loadRestaurants()
    }
    
    // MARK: - Restaurant selected
    
    func restaurantSelected(position: Int) {
        Router.switchModule(view: .DetailViewController(position: position))
    }
}

// MARK: - Interactor Output Protocol

extension TableViewPresenter: TableViewInteractorOutputProtocol {
    func restaurantsLoaded(restaurantsList: [RestaurantModel]) {
        view?.showRestaurants(restaurants: restaurantsList)
    }
    
    func restaurantsNotLoaded(error: NetworkingError) {
        view?.showError(errorString: error.localizedDescription)
    }
}
