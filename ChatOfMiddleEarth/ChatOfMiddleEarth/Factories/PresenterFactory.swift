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
    func makeChatPresenter(withCoordinator coordinator: MainCoordinator, withFriend friend: String) -> ChatPresenter
}

class PresenterFactoryImplementation: PresenterFactory {

    private let service = ChatRoom()
    
    func makeLoginPresenter(withCoordinator coordinator: MainCoordinator) -> LoginPresenter {
        let joinChatUseCaseForm = JoinChatUseCaseForm()
        let loginPresenter = LoginPresenter(coordinator: coordinator,
                                            joinChatFormUseCase: joinChatUseCaseForm)
        return loginPresenter
    }
    
    func makeFellowshipPresenter(withCoordinator coordinator: MainCoordinator, username:String, port: String) -> FellowshipPresenter {
        let joinChatRepository = JoinChatRepository(chatRoom: service)
        let loginUseCase = LoginUseCase(joinChatRepository: joinChatRepository)
        let fellowshipPresenter = FellowshipPresenter(coordinator: coordinator,
                                                      loginUseCase: loginUseCase,
                                                      username: username, port: port)
        return fellowshipPresenter
    }
    
    func makeChatPresenter(withCoordinator coordinator: MainCoordinator,
                           withFriend friend: String) -> ChatPresenter {
        let chatRepository = ChatRepository(chatRoom: service)
        let chatUseCase = ChatUseCase(chatRepository: chatRepository)
        let presenter = ChatPresenter(coordinator: coordinator, chatUseCase: chatUseCase, friendToChat: friend)
        service.attachDelegate(delegate: presenter)
        return presenter
    }
    
}

