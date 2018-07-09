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
    private static var startViewController = UIViewController()
    private static var navigationController = UINavigationController()

    static func configureAndCreateFirstModule() -> UIViewController {
        self.startViewController = self.createLoginModule()
        self.navigationController = self.createNavigationController()

        return self.startViewController
    }
    
    // MARK: - Switching Modules
    
    static func switchModule(view: ControllerEnum) {
        var handler: (UIWindow?) -> ()
        
        guard let delegate = appDelegate else {
            print("Router: appDelegate not unwrapped.")
            return
        }
        
        switch view {
        case .LoginController:
            handler = { window in
                window?.rootViewController = self.startViewController
            }
        case .TableViewController:
            let viewController = self.createTableViewModule()
            self.navigationController.addChildViewController(viewController)

            viewController.didMove(toParentViewController: self.navigationController)
            handler = { window in
                window?.rootViewController = self.navigationController
            }
            delegate.switchViewControllers (handler: handler)


        case .DetailViewController(let position):
            let viewController = self.createDetailViewModule(position: position)
//            self.navigationController.addChildViewController(viewController)
            self.navigationController.pushViewController(viewController, animated: true)
//            viewController.didMove(toParentViewController: self.navigationController)


            handler = { window in
                window?.rootViewController?.view.addSubview(viewController.view)
            }
        }
        
//        delegate.switchViewControllers (handler: handler)
    }
}

// MARK: - Creating Modules

extension Router {
    
    private static func createLoginModule() -> UIViewController {
        
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
    
    private static func createTableViewModule() -> UIViewController {
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
    
    private static func createDetailViewModule(position: Int) -> UIViewController {
        guard let view = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            print("Router: DetailViewController could not be instantiated.")
            return UIViewController()
        }
        
        let presenter = DetailPresenter()
        let interactor = DetailInteractor()
        let networkSession = MockRestaurantListNetworking()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.restaurantIndex = position
        interactor.presenter = presenter
        interactor.networkSession = networkSession
        
        return view
    }
}


// MARK: - Helpers

extension Router {
    private static func createNavigationController() -> UINavigationController {
        guard let navigationController = storyboard.instantiateViewController(withIdentifier: "TableViewNavigationController") as? UINavigationController else {
            print("Router: NavigationController could not be instantiated.")
            return UINavigationController()
        }
        
        return navigationController
    }
}

