//
//  DetailPresenter.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 05.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {
    
    // MARK: - Properties
    
    var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var restaurantIndex: Int?
    
    // MARK: - update view with single restaurant
    
    func updateRestaurantView() {
        guard let index = self.restaurantIndex else{
            let error = NetworkingError.Other(description: "Restaurant cannot be shown.")
            view?.showError(errorString: error.description)
            return
        }
        interactor?.loadRestaurant(index: index)
    }    
}

// MARK: - Interactor Output Protocol

extension DetailPresenter: DetailInteractorOutputProtocol {
    func restaurantLoaded(restaurant: RestaurantModel) {
        view?.showRestaurant(restaurant: restaurant)
    }
    
    func restaurantNotLoaded(error: NetworkingError) {
        view?.showError(errorString: error.description)
    }
}
