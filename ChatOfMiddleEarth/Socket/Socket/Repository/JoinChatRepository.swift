//
//  JoinChatRepository.swift
//  Socket
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Domain

public class JoinChatRepository {
    private var chatRoom: ChatRoomInterface
    
    public init(chatRoom: ChatRoomInterface) {
        self.chatRoom = chatRoom
    }
}

extension JoinChatRepository: Domain.JoinChatRepositoryProtocol {
    public func registerUserInServer(usingUserName username: String,
                                     andPortNumber portNumber: UInt32,
                                     toFriend friend: String,
                                     andCompletion completion: (Result<Void, Error>) -> Void) {
        chatRoom.setupNetworkCommunication(inPort: portNumber)
        chatRoom.joinChat(username: username, friend: friend)
        completion(.success(()))
        
    }
    

}
