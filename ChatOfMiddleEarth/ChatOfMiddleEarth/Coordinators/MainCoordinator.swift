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
    internal var navigationController: CustomNavigation
    private let sceneFactory: ViewControllersFactory
    
    init(navigationController: CustomNavigation, sceneFactory: ViewControllersFactory) {
        self.navigationController = navigationController
        self.sceneFactory = sceneFactory
    }

    func start() {
        openLoginScreen()
    }

    private func openLoginScreen() {
        let loginViewController = sceneFactory.makeLoginViewController(withCoordinator: self)
        navigationController.setupNavigation(withTitle: "", andHiddenBar: true, andAnimation: true)
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    private func openFellowshipScene(username: String, port: String) {
        let fellowshipViewController = sceneFactory.makeFellowshipViewController(withCoordinator: self,
                                                                                 username: username, port: port)
        navigationController.setupNavigation(withTitle: "Contatos", andHiddenBar: false, andAnimation: true)
        navigationController.pushViewController(fellowshipViewController, animated: true)
    }
    
    private func openChatScene() {
        let chatVC = sceneFactory.makeChatViewController(withCoordinator: self)
        navigationController.setupNavigation(withTitle: "", andHiddenBar: true, andAnimation: true)
        navigationController.pushViewController(chatVC, animated: true)
    }
}

// MARK: - Login Delegate
extension MainCoordinator: LoginCoordinating {
    func showFellowshipScreen(withUser username: String, andportNumber portnumber: String) {
        openFellowshipScene(username: username, port: portnumber)
    }
}

// MARK: - Fellowship Delegate
extension MainCoordinator: FellowshipCoordinating {
    func showChatScreen(withUser username: String, andportNumber portnumber: String) {
        openChatScene()
    }
}

// MARK: - Fellowship Delegate
extension MainCoordinator: ChatCoordinating {
    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
