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
    private var joinChatFormUseCase: JoinChatUseCaseFormProtocol?
    
    required init(coordinator: LoginCoordinating,
                  joinChatFormUseCase: JoinChatUseCaseFormProtocol) {

        self.coordinator = coordinator
        self.joinChatFormUseCase = joinChatFormUseCase
    }
}

extension LoginPresenter: LoginViewPresenting {
    func joinInChat(withUser user: String, andPort port: String) {
        joinChatFormUseCase?.execute(withUser: user, andPortNumber: port) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.coordinator?.showFellowshipScreen(withUser: user, andportNumber: port)
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }

}
