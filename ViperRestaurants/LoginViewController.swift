//
//  LoginViewController.swift
//  ViperRestaurants
//
//  Created by Nele Müller on 02.07.18.
//  Copyright © 2018 Nele Müller. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController{
    
    // MARK: - Properties
    
    var presenter: LoginPresenterProtocol?
    
    // MARK: - Outlets
    
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            self.showError(errorString: "Es ist ein Fehler aufgetreten.")
            return
        }
        
        let login = LoginCredentials(name: username, password: password)
        presenter?.updateView(data: login)
    }
}

extension LoginViewController: LoginViewProtocol {
    func showError(errorString: String) {
        let alert = UIAlertController(title: "Error", message: errorString, preferredStyle:
            .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
}
