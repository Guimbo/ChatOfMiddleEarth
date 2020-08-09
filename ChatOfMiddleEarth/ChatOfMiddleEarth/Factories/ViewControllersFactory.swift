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
}

class ViewControllersFactoryImplementation: ViewControllersFactory {
    
    func makeLoginViewController(withCoordinator coordinator: MainCoordinator) -> LoginViewController {
        let presenter = LoginPresenter(coordinator: <#T##LoginCoordinating#>,
                                       loginUseCase: <#T##LoginUseCaseProtocol#>,
                                       joinChatFormUseCase: <#T##JoinChatUseCaseFormProtocol#>)
        let loginVC = LoginViewController(presenter: presenter)

        return loginVC
    }
}
