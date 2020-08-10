//
//  PresenterFactory.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation
import Socket
import Domain

protocol PresenterFactory: AnyObject {
    func makeLoginPresenter(withCoordinator coordinator: MainCoordinator) -> LoginPresenter
}

class PresenterFactoryImplementation: PresenterFactory {
    
    func makeLoginPresenter(withCoordinator coordinator: MainCoordinator) -> LoginPresenter {
        
        let service = ChatRoom()
        let joinChatRepository = JoinChatRepository(chatRoom: service)
        let joinChatUseCaseForm = JoinChatUseCaseForm()
        let loginUseCase = LoginUseCase(joinChatRepository: joinChatRepository)
        let loginPresenter = LoginPresenter(coordinator: coordinator,
                                            loginUseCase: loginUseCase,
                                            joinChatFormUseCase: joinChatUseCaseForm)
        return loginPresenter
    }
}

