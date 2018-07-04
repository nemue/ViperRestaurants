//
//  LoginInteractor.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 02.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation

class LoginInteractor: LoginInteractorInputProtocol {
    var presenter: LoginInteractorOutputProtocol?
    var networkSession: LoginNetworkingProtocol?
    
    func authenticateLoginData(data: LoginCredentials) {
        
        // send LoginCredentials
        
        guard let result = self.networkSession?.request(data: data) else {
            presenter?.loginFailure(error: NetworkingError.ConnectionError)
            return
        }
        
        switch result {
        case .failure(let error):
            presenter?.loginFailure(error: error)
        default:
            guard let userId = result.value, let userIdInt = Int(userId) else {
                presenter?.loginFailure(error: NetworkingError.TypecastingError)
                return
            }
            
            presenter?.loginSuccess(userId: userIdInt)
        }
    }
}
