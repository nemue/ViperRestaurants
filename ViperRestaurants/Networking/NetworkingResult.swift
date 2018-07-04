//
//  Result.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 02.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation

enum NetworkingResult<Value> {
    case success(Value)
    case failure(NetworkingError)
    
    public var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }
    
    public var error: NetworkingError? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}
