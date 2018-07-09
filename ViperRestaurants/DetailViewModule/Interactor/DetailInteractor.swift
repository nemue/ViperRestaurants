//
//  DetailViewInteractorProtocol.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 05.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {
    
    // MARK: - Properties
    
    var presenter: DetailInteractorOutputProtocol?
    var networkSession: TableNetworkingProtocol?
    
    // MARK: - Interactor Input Protocol
    
    // hier besser: Abfrage von APIManager o.Ä., der dann entscheidet,
    // ob aus Speicher oder Netzwerk geladen wird
    
    func loadRestaurant(index: Int) {
        guard let networkingResult = networkSession?.request() else {
            presenter?.restaurantNotLoaded(error: NetworkingError.ConnectionError)
            return
        }
        
        switch networkingResult {
        case .failure(let error):
            presenter?.restaurantNotLoaded(error: error)
        case .success(let value):
            let restaurantList = value
            let restaurant = restaurantList[index]
            presenter?.restaurantLoaded(restaurant: restaurant)
        }
    }
    
}
