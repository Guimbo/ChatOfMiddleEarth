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


extension ChatViewController: ChatRoomDelegate {
func received(message: Message) {
    print("Receiving")
    print(message)
    //insertNewMessageCell(message)
    //checkGiveUp(message: message)
  }
}
