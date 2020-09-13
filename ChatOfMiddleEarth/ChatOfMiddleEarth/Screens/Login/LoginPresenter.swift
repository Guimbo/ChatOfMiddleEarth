//
//  LoginPresenter.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 08/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation
import Domain

protocol LoginCoordinating {
    func showFellowshipScreen(user: String, xPos: String, yPos: String)
}

class LoginPresenter {
    private var coordinator: LoginCoordinating?
    private var joinChatFormUseCase: JoinChatUseCaseFormProtocol?
    weak var view: LoginViewControllerDelegate?
    private var loginUseCase: LoginUseCase?
    
    required init(coordinator: LoginCoordinating,
                  joinChatFormUseCase: JoinChatUseCaseFormProtocol,
                  loginUseCase: LoginUseCase) {

        self.coordinator = coordinator
        self.joinChatFormUseCase = joinChatFormUseCase
        self.loginUseCase = loginUseCase
    }
    
    func attachView(_ viewController: LoginViewControllerDelegate) {
        self.view = viewController
    }
}

extension LoginPresenter: LoginViewPresenting {
    func doLogin(user: String, xPos: String, yPos: String) {
        joinChatFormUseCase?.execute(username: user, xPos: xPos, yPos: yPos) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.loginUseCase?.execute(username: user, xPos: xPos, yPos: yPos){ result in
                    switch result{
                    case .success:
                        debugPrint("---Permissão para continuar---")
                        self.coordinator?.showFellowshipScreen(user: user, xPos: xPos, yPos: yPos)
                    case .failure(let error):
                        debugPrint(error.localizedDescription)
                        view?.showAlert(withMessage: "nome já usado, favor escolher outro.")
                    }
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
                view?.showAlert(withMessage: "Nome inválido.")
            }
        }
    }
}
