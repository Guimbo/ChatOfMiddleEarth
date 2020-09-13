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
        chatRoom.setupNetworkCommunication()
        chatRoom.joinInSpace()
    }
}

extension JoinChatRepository: Domain.JoinChatRepositoryProtocol {
    
    func successResponse() {}
    
    
    public func registerUserInServer(username: String, xPos: String, yPos: String,
                                     andCompletion completion: (Result<Void, LoginUseCaseError>) -> Void) {

        if chatRoom.validateUsername(username: username) {
            completion(.failure(.username(.invalid)))
        }
        else {
            chatRoom.joinUsingLocation(username: username, xPos: xPos, yPos: yPos)
            completion(.success(()))
            
        }
        
    }

}
