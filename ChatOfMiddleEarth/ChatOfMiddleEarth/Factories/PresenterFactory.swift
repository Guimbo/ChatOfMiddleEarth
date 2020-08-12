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
    func makeFellowshipPresenter(withCoordinator coordinator: MainCoordinator,
                                 username:String,
                                 port: String) -> FellowshipPresenter
    func makeChatPresenter(withCoordinator coordinator: MainCoordinator) -> ChatPresenter
}

class PresenterFactoryImplementation: PresenterFactory {

    private let service = ChatRoom()
    
    func makeLoginPresenter(withCoordinator coordinator: MainCoordinator) -> LoginPresenter {
        let joinChatRepository = JoinChatRepository(chatRoom: service)
        let joinChatUseCaseForm = JoinChatUseCaseForm()
        let loginUseCase = LoginUseCase(joinChatRepository: joinChatRepository)
        let loginPresenter = LoginPresenter(coordinator: coordinator,
                                            loginUseCase: loginUseCase,
                                            joinChatFormUseCase: joinChatUseCaseForm)
        return loginPresenter
    }
    
    func makeFellowshipPresenter(withCoordinator coordinator: MainCoordinator, username:String, port: String) -> FellowshipPresenter {
        let fellowshipPresenter = FellowshipPresenter(coordinator: coordinator, username: username, port: port)
        return fellowshipPresenter
    }
    
    func makeChatPresenter(withCoordinator coordinator: MainCoordinator) -> ChatPresenter {
        let chatRepository = ChatRepository(chatRoom: service)
        let chatUseCase = ChatUseCase(chatRepository: chatRepository)
        let presenter = ChatPresenter(coordinator: coordinator, chatUseCase: chatUseCase)
        service.attachDelegate(delegate: presenter)
        return presenter
    }
    
}

