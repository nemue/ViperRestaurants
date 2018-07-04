//
//  NetworkingError.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 02.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case ConnectionError
    case AuthenticationError
    case TypecastingError
    
    public var description: String {
        switch self {
        case .ConnectionError:
            return "No Internet connection."
        case .AuthenticationError:
            return "Wrong username or password."
        case .TypecastingError:
            return "Typecasting failed."
        }
    }
}
