//
//  NetworkingProtocol.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 02.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation

protocol LoginNetworkingProtocol {
    func request(data: LoginCredentials) -> NetworkingResult<String>
}
