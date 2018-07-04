//
//  Router.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 02.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import Foundation
import UIKit

class Router {
    
    // MARK: - Properties
    
    static var storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    static var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    // MARK: - Switching Modules
    
    static func switchModule(view: ControllerEnum) {
        guard let delegate = appDelegate else {
            return
        }
        var viewController: UIViewController
        
        switch view {
        case .LoginController:
            viewController = self.createLoginModule()
            delegate.switchControllers(to: viewController)
        case .TableViewController:
            viewController = self.createTableViewModule()
            delegate.switchControllers(to: viewController)
        case .DetailViewController:
            viewController = self.createDetailViewModule()
            delegate.switchControllers(to: viewController)
        }
    }
    
    //MARK: - Creating Modules
    
    static func createLoginModule() -> UIViewController {
        
        guard let view = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            print("Router: LoginViewController could not be instantiated.")
            return UIViewController()
        }
        
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let networkSession = MockLoginNetworking()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.networkSession = networkSession
        
        return view
    }
    
    static func createTableViewModule() -> UIViewController {
        guard let view = storyboard.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController else {
            print("Router: TableViewController could not be instantiated.")
            return UIViewController()
        }
        
        let presenter = TableViewPresenter()
        let interactor = TableViewInteractor()
        let networkSession = MockRestaurantListNetworking()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.networkSession = networkSession
        
        return view
    }
    
    static func createDetailViewModule() -> UIViewController {
        // TODO
        return UIViewController()
    }
}

