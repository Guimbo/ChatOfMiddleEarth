//
//  LoginViewController.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 08/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import UIKit

protocol LoginViewPresenting {
    
    func doLogin(user: String, xPos: String, yPos: String)
    func showAlert(withMessage message: String)
}

class LoginViewController: UIViewController {
    
    private lazy var loginView = LoginView()
    private let presenter: LoginViewPresenting?
    
    init(presenter: LoginViewPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func loadView() {
        super.loadView()
        loginView.delegate = self
        self.view = loginView
    }


}

extension LoginViewController: LoginViewDelegate {
    func doLogin(user: String, xPos: String, yPos: String) {
        presenter?.doLogin(user: user, xPos: xPos, yPos: yPos)
    }
    func showAlert(withMessage message: String) {
        let alert = UIAlertController.attentionAlert(message: message)
        present(alert, animated: true, completion: nil)
    }
    
}
