//
//  ViewControllerFactory.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 08/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation
import Socket
import Domain
protocol ViewControllersFactory: AnyObject {
    func makeLoginViewController(withCoordinator coordinator: MainCoordinator) -> LoginViewController
    func makeFellowshipViewController(withCoordinator coordinator: MainCoordinator) -> FellowshipViewController
}

class ViewControllersFactoryImplementation: ViewControllersFactory {
    
    let presenterFactory:PresenterFactory
    
    init(presenterFactory: PresenterFactory) {
        self.presenterFactory = presenterFactory
    }

    func makeLoginViewController(withCoordinator coordinator: MainCoordinator) -> LoginViewController {
        let presenter = presenterFactory.makeLoginPresenter(withCoordinator: coordinator)
        let loginVC = LoginViewController(presenter: presenter)

        return loginVC
    }
    
    func makeFellowshipViewController(withCoordinator coordinator: MainCoordinator) -> FellowshipViewController {
        let presenter = presenterFactory.makeFellowshipPresenter(withCoordinator: coordinator)
        let fellowshipVC = FellowshipViewController(presenter: presenter)
        return fellowshipVC
    }
}
