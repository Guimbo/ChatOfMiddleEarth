//
//  ChatViewPresenter.swift
//  ChatOfMiddleEarth
//
//  Created by Guilherme Araujo on 11/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation
import Domain

protocol ChatCoordinating {
    func dismiss()
}

class ChatPresenter {
    private var coordinator: ChatCoordinating
    private var chatUseCase: ChatUseCaseProtocol
    
    private var messages:[Message] = []
    
    private weak var delegateViewController: ChatViewControllerDelegate?
    
    required init(coordinator: ChatCoordinating, chatUseCase: ChatUseCaseProtocol) {
        self.coordinator = coordinator
        self.chatUseCase = chatUseCase
    }
    
}

extension ChatPresenter: ChatViewPresenting {
    
    func attachDelegate(_ delegate: ChatViewControllerDelegate) {
        self.delegateViewController = delegate
    }
    
    func sendMessage(message: String) {
        chatUseCase.sendMessageInNetworking(usingMessage: message)
    }
    
    func addMessage(message: Message) {
        self.messages.append(message)
    }
    
    func getMessagesCount() -> Int {
        return self.messages.count
    }
    
    func getMessage(ByIndex index: Int) -> Message {
        return self.messages[index]
    }
    
    func finishChat() {
        chatUseCase.stopSession()
    }
}

extension ChatPresenter: ChatRoomDelegate {
    func received(message: Message) {
        print("Receiving")
        print(message)
        delegateViewController?.insertNewMessageCell(message)
        delegateViewController?.checkGiveUp(message: message)
      }
}
