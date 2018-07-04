//
//  LoginPresenter.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 02.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    
    // MARK: - Properties
    
    var interactor: LoginInteractorInputProtocol?
    var view: LoginViewProtocol?
    
    // MARK: Login Presenter Protocol
    
    func updateView(data: LoginCredentials) {
        self.interactor?.authenticateLoginData(data: data)
    }
}

// MARK: - Login Interactor Input Protocol

extension LoginPresenter: LoginInteractorOutputProtocol {
    func loginFailure(error: NetworkingError) {
        view?.showError(errorString: error.description)
    }
    
    func loginSuccess(userId: Int) {
        _ = Router.switchModule(view: ControllerEnum.TableViewController)
    }
}
