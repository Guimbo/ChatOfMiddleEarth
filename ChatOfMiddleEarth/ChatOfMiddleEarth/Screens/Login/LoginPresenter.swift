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
    func showFellowshipScreen(withUser username: String, andportNumber portnumber: String)
}

class LoginPresenter {
    private var coordinator: LoginCoordinating?
    private var loginUseCase: LoginUseCaseProtocol?
    private var joinChatFormUseCase: JoinChatUseCaseFormProtocol?
    
    required init(coordinator: LoginCoordinating,
                  loginUseCase: LoginUseCaseProtocol,
                  joinChatFormUseCase: JoinChatUseCaseFormProtocol) {

        self.coordinator = coordinator
        self.loginUseCase = loginUseCase
        self.joinChatFormUseCase = joinChatFormUseCase
    }
}

extension LoginPresenter: LoginViewPresenting {
    func joinInChat(withUser user: String, andPort port: String) {
        joinChatFormUseCase?.execute(withUser: user, andPortNumber: port) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.loginUseCase?.execute(withUser: user, andPortNumber: port) { [weak self] loginResult in
                    guard let self = self else { return }
                    switch result{
                    case .success:
                        print(user, port)
                        self.coordinator?.showFellowshipScreen(withUser: user, andportNumber: port)
                    case .failure(let error):
                        debugPrint(error.localizedDescription)
                    }
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }

}
