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

    private func openLoginScreen() {
        let loginViewController = sceneFactory.makeLoginViewController(withCoordinator: self)
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    private func openFellowshipScene(username: String, port: String) {
        let fellowshipViewController = sceneFactory.makeFellowshipViewController(withCoordinator: self,
                                                                                 username: username, port: port)
        navigationController.pushViewController(fellowshipViewController, animated: true)
    }
}

// MARK: - Login Delegate
extension MainCoordinator: LoginCoordinating {
    func showFellowshipScreen(withUser username: String, andportNumber portnumber: String) {
        openFellowshipScene(username: username, port: portnumber)
    }
}

extension MainCoordinator: FellowshipCoordinating {
    func showChatScreen(withUser username: String, andportNumber portnumber: String) {
        #warning("remember: Show Chat")
    }
}
