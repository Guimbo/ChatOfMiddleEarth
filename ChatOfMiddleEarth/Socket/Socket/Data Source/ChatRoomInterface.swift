//
//  ChatRoomProtocol.swift
//  Socket
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation 

public protocol ChatRoomInterface {
    
    func setupNetworkCommunication(inPort portnumber: UInt32)
    func joinChat(username: String, friend: String)
    func send(message: String, toFriend friend: String)
    func stopChatSession()

}
