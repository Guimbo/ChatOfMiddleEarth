//
//  LoginViewController.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 08/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import UIKit

protocol LoginViewPresenting {
    
    func joinInChat()
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
    
    override func loadView() {
        super.loadView()
        self.view = loginView
    }


}
