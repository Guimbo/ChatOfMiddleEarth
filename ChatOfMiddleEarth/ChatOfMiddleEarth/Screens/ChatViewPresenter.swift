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
    private var middleware: Middleware?
    
    private weak var delegateViewController: ChatViewControllerDelegate?
    private var friendToChat: String
    
    required init(coordinator: ChatCoordinating, chatUseCase: ChatUseCaseProtocol, friendToChat: String) {
        self.coordinator = coordinator
        self.chatUseCase = chatUseCase
        self.friendToChat = friendToChat
    }
    
}

extension ChatPresenter: ChatViewPresenting {
    
    func getFriend() -> String {
        return friendToChat
    }
    
    func attachDelegate(_ delegate: ChatViewControllerDelegate) {
        self.delegateViewController = delegate
    }
    
    func sendMessage(message: String) {
        chatUseCase.sendMessageInNetworking(usingMessage: message, toDestiny: friendToChat)
    }
    
    func addMessage(message: Message) {
        var newMessage = message
        newMessage.destiny = friendToChat
        self.messages.append(newMessage)
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
        if message.senderUsername.contains("NOT"){
            self.middleware = Middleware()
            print("Abre o Middleware")
        }
        delegateViewController?.insertNewMessageCell(message)
        delegateViewController?.checkGiveUp(message: message)
      }
}
