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
    private static var navigationController = UINavigationController()
    
    // MARK: - Switching Modules
    
    static func switchModule(view: ControllerEnum) {
        var handler: (UIWindow?) -> ()
        
        guard let delegate = appDelegate else {
            return
        }
        
        switch view {
        case .LoginController:
            handler = { window in
                window?.rootViewController = self.createLoginModule()
            }
        case .TableViewController:
            let viewController = self.createTableViewModule()
            self.navigationController = createNavigationController()
            self.navigationController.addChildViewController(viewController)
            handler = { window in
                window?.rootViewController = self.navigationController
            }

        case .DetailViewController:
            let viewController = self.createDetailViewModule()
            self.navigationController.addChildViewController(viewController)
            handler = { window in
                window?.rootViewController = self.navigationController
            }
        }
        
        delegate.switchViewControllers (handler: handler)
    }
    
    // MARK: - Creating Modules
    
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


// MARK: - Helpers

extension Router {
    static func createNavigationController() -> UINavigationController {
//        if navigationController.storyboard.id
        guard let navigationController = storyboard.instantiateViewController(withIdentifier: "TableViewNavigationController") as? UINavigationController else {
            print("Router: NavigationController could not be instantiated.")
            return UINavigationController()
        }
        self.navigationController = navigationController
        
        return navigationController
    }
}

