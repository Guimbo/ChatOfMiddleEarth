//
//  ChatUseCase.swift
//  Domain
//
//  Created by Guilherme Araujo on 11/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

public protocol ChatUseCaseProtocol {
    func stopSession()
    func sendMessageInNetworking(usingMessage message: String)
}

public class ChatUseCase {
    
    private let chatRepository: ChatRepositoryProtocol
    
    public init(chatRepository: ChatRepositoryProtocol) {
        self.chatRepository = chatRepository
    }
}

extension ChatUseCase: ChatUseCaseProtocol {
    public func stopSession() {
        chatRepository.stopChatSession()
    }
    
    public func sendMessageInNetworking(usingMessage message: String) {
        chatRepository.sendMessage(message: message)
    }
    
    
    
}
