//
//  TableViewInteractor.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 03.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation

class TableViewInteractor: TableViewInteractorInputProtocol {
    
    // MARK: - Properties
    
    var presenter: TableViewInteractorOutputProtocol?
    var networkSession: TableNetworkingProtocol?
    
    // MARK: - Load Restaurants
    
    func loadRestaurants() {
        guard let networkingResult = self.networkSession?.request() else {
            presenter?.restaurantsNotLoaded(error: NetworkingError.ConnectionError)
            return
        }
        
        switch networkingResult {
        case .failure(let error):
            presenter?.restaurantsNotLoaded(error: error)
        default:
            guard let restaurantList = networkingResult.value else {
                presenter?.restaurantsNotLoaded(error: NetworkingError.TypecastingError)
                return
            }
            
            presenter?.restaurantsLoaded(restaurantsList: restaurantList)
        }
    }
}
