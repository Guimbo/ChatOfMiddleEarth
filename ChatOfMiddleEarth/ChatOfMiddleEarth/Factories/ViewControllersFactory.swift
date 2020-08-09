//
//  ViewControllerFactory.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 08/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

protocol ViewControllersFactory: AnyObject {
    func makeLoginViewController(withCoordinator coordinator: MainCoordinator) -> LoginViewController
}

class ViewControllersFactoryImplementation: ViewControllersFactory {
    
    func makeLoginViewController(withCoordinator coordinator: MainCoordinator) -> LoginViewController {
        let presenter = LoginPresenter(coordinator: coordinator)
        let loginVC = LoginViewController(presenter: presenter)

        return loginVC
    }
}
