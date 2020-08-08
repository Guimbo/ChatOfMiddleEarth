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

    func start() {
        openLoginScreen()
    }

    func openLoginScreen() {

    }
}

// MARK: - Login Delegate
extension MainCoordinator: LoginCoordinatorDelegate {
    func openHomeFromLogin(_ coordinator: LoginCoordinator) {
        removeChildCoordinator(coordinator)
        openHomeScreen()
    }

}
