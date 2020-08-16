//
//  ChatRepository.swift
//  Socket
//
//  Created by Guilherme Araujo on 11/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Domain

public class ChatRepository {
    private var chatRoom: ChatRoomInterface
    
    public init(chatRoom: ChatRoomInterface) {
        self.chatRoom = chatRoom
    }
}

extension ChatRepository: Domain.ChatRepositoryProtocol {
    public func sendMessage(message: String, toDestiny destiny: String) {
        chatRoom.send(message: message, toFriend: destiny)
    }

    public func stopChatSession() {
        chatRoom.stopChatSession()
    }
}
