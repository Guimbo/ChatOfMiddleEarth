//
//  LoginPresenter.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 08/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

protocol LoginCoordinating {
    func showChatScreen()
}

class LoginPresenter {
    private var coordinator: LoginCoordinating?
    
    required init(coordinator: LoginCoordinating) {
        self.coordinator = coordinator
    }
}

extension LoginPresenter: LoginViewPresenting {
    func joinInChat() {
        coordinator?.showChatScreen()
    }
}
