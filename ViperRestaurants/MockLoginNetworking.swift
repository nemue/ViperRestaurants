//
//  MockNetworking.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 03.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation

class MockLoginNetworking: LoginNetworkingProtocol {
    func request(data: LoginCredentials) -> NetworkingResult<String> {
        if(data.name == "Nele" && data.password == "pw") {
            let result = NetworkingResult.success("1")
            return result
        }
        
        else {
            let result = NetworkingResult<String>.failure(NetworkingError.AuthenticationError)
            return result
        }
    }
}
