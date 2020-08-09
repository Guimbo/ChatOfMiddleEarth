//
//  ViewControllerFactory.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 08/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

protocol ViewControllersFactory {
    func makeLoginViewController() -> LoginViewController
}

class ViewControllersFactoryImplementation: ViewControllersFactory {
    
    let coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func makeLoginViewController() -> LoginViewController {
        let presenter = LoginPresenter(coordinator: coordinator)
        let loginVC = LoginViewController(presenter: presenter)

        return loginVC
    }
}
