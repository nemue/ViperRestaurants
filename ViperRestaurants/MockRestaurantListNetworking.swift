//
//  MockRestaurantListNetworking.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 03.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation

class MockRestaurantListNetworking: TableNetworkingProtocol {

    // MARK: - Mock Network Request

    func request() -> NetworkingResult<[RestaurantModel]> {
        let restaurantList = generateRestaurants()
        let result = NetworkingResult.success(restaurantList)
        return result
    }
}

// MARK: - Helpers

extension MockRestaurantListNetworking {
    
    func generateRestaurants() -> [RestaurantModel] {
        var list = [RestaurantModel]()

        for i in 1...20 {
            let name = "Restaurant " + String(describing: i)
            let address = "Hauptstraße " + String(describing: i)
            let rating =  Int(arc4random()) % 5
            
            list.append(RestaurantModel(name: name, address: address, rating: rating))
        }
        
        return list
    }
}
