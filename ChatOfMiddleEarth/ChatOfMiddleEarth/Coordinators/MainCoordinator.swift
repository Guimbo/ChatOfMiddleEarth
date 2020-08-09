//
//  MainCoordinator.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 08/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Main Coordinator
final class MainCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = [Coordinator]()
    internal var navigationController: UINavigationController
    #warning("remember: Change to custom navigation")
    private let sceneFactory: ViewControllersFactory
    
    init(navigationController: UINavigationController, sceneFactory: ViewControllersFactory) {
        self.navigationController = navigationController
        self.sceneFactory = sceneFactory
    }

    func start() {
        openLoginScreen()
    }

    func openLoginScreen() {
        let loginView = sceneFactory.makeLoginViewController()
        navigationController.pushViewController(loginView, animated: true)
    }
}

// MARK: - Login Delegate
extension MainCoordinator: LoginCoordinating {
    func showChatScreen() {
        openLoginScreen()
    }
}
